Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACC194AFB
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731340661; cv=fail; b=qAxbOhlLNIBrOuDIvZutIZ3Sq7sLzNwhAQSpPb0hxJmG0rUG3F0tEYmKaRRH6vJCsS5aHt1KAbmZMLpSfmtmqFqRLq3Rj/HACMNud1XzOAxDSdbEUw3rCKEc0QWhaCr1okVgQ//WAHnONES69Catjd0RYQC2Cz1Bn4xSjMDtk6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731340661; c=relaxed/simple;
	bh=3+qjsSTjfM6HNzn+dUlmH+GOC4EtxC+dSVpovZW0vkE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=HH0ndxHgbUDrRVDiTSyaesaXeyS2BBLWHEmFA3flKOs++AL+31OwOxj5eYwDcgPv2G3H83cMLRDCgvVUu7M6Bi6JL1lEZlYzjlExHydBMuNRbJ1b0I3G9P5Ynf5zKsh9Y++MbPMmCcPTJ5JW/XfImrbXGYl27eNccqPmVlFjzEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ng6c5B0Y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R9egzkNs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ng6c5B0Y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R9egzkNs"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9soKG017678
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=FlhVsmI+bAbNnDHgMy
	KtK1h1Lp4TdhOmy7t6PjDEeC8=; b=ng6c5B0YQft7CZOMVBWph+Uxz/X5OwOe1E
	4OE4kT9axexyT85IDo4Cplu8TtyaucKxxTF+ZpdytXOFI9bX8R6YM3ewlZ6WebU8
	hvoNWZF9jWEaxtwkDD2tP0lQEpxBTkzwWO/y4QMU+hm0Ph3Yae5jEmHGBbURKDrK
	s4KqddCeWzufflfCQyJSYIsrDooCt8pa/kI7Avpfhj5c7LThuGVvZm2HgTF5QJaj
	JRI3oOZ+fxd2oT+3QNSQ5KJQqmUL5OpL6sivQrsEi3vCmH/GmwQ12jraJPzf5wtl
	u8zU81wlO84Vgc/abl4U8AvoiZZ2ayfQp1kf9J2CrU53V0pqudMw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n4ts9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:57:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABFIHX1023621
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:57:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66x5dh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edAInCyWLv6IcJOQ79t2O309TnBGP2u23g0UiBrPkSjA546RTl5AvnzI2BhhWA3yaoAMqaHhUXeKIU7UR2qQm7BS/e3k/I5ViRGbzXR5DeoG/iakLk2jtAEvYAguu+NUzsCvRVguPIBXWtTHWIp1CtnJyiPstUoUTsGH+L7aQ11zbp9hpy1Y4RDfnTbr5NLd7DR0gbZwxrZ+lWbRV5KX2i7S3MFdHFBDrZmDThf7ZD2KWZsN87j0xwrD6PwpG9Rk81y8jFcU+SmlG8HHbqSK/2ekOIFi/G4Vh3kSJJt15euCoONoSD9dJ/UrrLccVOUo6f7x0M/VW8Hn7hRRcGCcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlhVsmI+bAbNnDHgMyKtK1h1Lp4TdhOmy7t6PjDEeC8=;
 b=ETxBL/N4XqYJyHRmxqyZqik550DMC6P9kmDn7usQSJHJILXeeDzZ/MzlM0JNjzcWuKhtgqN7LIENDfTcKiAMGIgMSyGyJ9Oy/K0dn8PLngP7+ZedscEsavwR5Sqw4snHg06whCyMy9VysCaDC9zQGDMweJNYo9ajmv/RbfWSkpD++pBEFwtAMpntEVfW76Oi5VxSMrOL66pYbB9LSJSCKFTBk/Rk4S3fqe/8VYq81id5KLxzdCJhg/5hgASCPs4OCxg3aNzuZQQkDhOY/IAJ7LuqUfdySDAtdHxGHWHsUpT3iUIyiXofGjdRtXyE3TEUhndi465ZaK8kf/N4Kmyawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlhVsmI+bAbNnDHgMyKtK1h1Lp4TdhOmy7t6PjDEeC8=;
 b=R9egzkNsZwt/r3RfzUIUngC1zYf/BI/XCP55kZ6ef1RWkV2gy+DOqgln8rC1U6mGN0evk6hX/A1X36JjfTZ0VgOazNgpqAnx7gwQc0Yfq10L76ZJ+6w60eQllQyqVY+uMUYDhcauYl52QNr/WaupmuQdMlCMH3R0rNFp+rW1WxU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 15:57:33 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:57:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] spec: add dtrace.pc to filelist
References: <CO1PR10MB47692B203911603E18C72BDAC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
Emacs: the Swiss Army of Editors.
Date: Mon, 11 Nov 2024 15:57:28 +0000
In-Reply-To: <CO1PR10MB47692B203911603E18C72BDAC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Sun, 10 Nov 2024 23:10:09 -0500")
Message-ID: <87ttcd4vbr.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0144.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::23) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BN0PR10MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: a92cda4c-4115-4571-7a23-08dd02698dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hVi+rMJkM37nglI8WUJY0DMZb4mFkDyShGGo+q8MmaEzfIp9hDuBHjYI+5oR?=
 =?us-ascii?Q?E3D1G86ap3XtXpW5kIhlH3X88XrKDiFHapvhuVquJctUqwiR3EleTQqKZrm/?=
 =?us-ascii?Q?QtL8PT2Gd7LuA+FT1eNZHMqHFVtvPpvBzfeJvfjalmtpjPTwUNLNKGvGoxxI?=
 =?us-ascii?Q?o4L9Z77+o/3lCciRYE1Q7saD7UXQACUz58u9Kp+i9mo/F868QidBg4btdCo8?=
 =?us-ascii?Q?1r0ptsblKLmyeZ0nDcpO7h+WQ5GStO8ASbuE7lxScsHn7VuEyG/iUZDtSCyy?=
 =?us-ascii?Q?55zleIM72hcyEUlqBXfQQoNUzTKmD0S9HMHFOMWC5s6g/bGjI1VrZ8b1ikl0?=
 =?us-ascii?Q?1sEgl9f8OkZtXmehDT30jGtT1s9BjEwZZXOeduJlRpipoTY1fqfeQroLuvmZ?=
 =?us-ascii?Q?8p6e7S6ojvcexN50ooNiGtyZGL/hnAqN7KntA8AN6JZdLCZwr/xrPImkD/Su?=
 =?us-ascii?Q?62ExZz9H9Pbr2ndgAZyePe5S+1YnkNSTLstqUcglhl3W/bNTnyypicx1rFk8?=
 =?us-ascii?Q?mczcDt3SK1mtPo7bTMDYIFCpiqG/SZC3wkWcUVXgdCgpZRbBpT/gHvrHwObZ?=
 =?us-ascii?Q?rwkynMlZ/1mBQh3UMUBCeswOuGcPwzJpL3mwXpyKGUXR1taDiTdS+Xa7dnbX?=
 =?us-ascii?Q?QJIPQaDJ47ipOVXxgPNey7nM4rq0EA5kTd42cBNLTdHc4tUuv2BwzWLBuzX0?=
 =?us-ascii?Q?JtUdnvZLvWFMQZmJiUGdgLlNHoufiwYy/rBXeDEVWjFLqyCgDcB9y3YDr02M?=
 =?us-ascii?Q?5L1R2CmS3z00M3WDr0iflPYX5o6s+IzBeiwvC+0q8dUglfbKfozVe0+NhpCn?=
 =?us-ascii?Q?HcETBlzOXeJ822h9Dvsvy5Rj4YR4TNdnUrL9DqVECtr6BBJg1VsLMlh+YVzr?=
 =?us-ascii?Q?nJZ6qPDfZD1XpCqPtv7kxGhK0VOZEMhhQ9gx6F+yXEPxCVqkwyj8XilHmLub?=
 =?us-ascii?Q?6eRmIn1L9pxctGoCYu2ajykLAu//+8wyRIwSQTcQwUB89m2OSOq6WOIBZ4f8?=
 =?us-ascii?Q?v8MGONcvRERYlS7/tuRMgZeJvjkyfjgTf6ak5ANGwtev+xTeD/i7YD7Q65uY?=
 =?us-ascii?Q?T9iMp3avCelsNiEgQOoAFJaOCAZC3+lIdE5c2SQDpqaBAA8CuZ6lE2a9kfLZ?=
 =?us-ascii?Q?5v0BodXsstMYq8d1I+ocMbNC031eflIHWa6y4MEoWX8uMA7miUmqQ/wVjxIQ?=
 =?us-ascii?Q?BEJMYDctQ9XHL7ro44QoFE8Pvxq+R5Ro33wyiUAmA7c2jnKdzwI0jRRXOww/?=
 =?us-ascii?Q?VAxnp16xZrnNZzBdSBKhZR6k696yuWcTTNgGfG0vJHelECI+tVYuVx+KL/Lp?=
 =?us-ascii?Q?OdxVMzQNdkvVwg8UAg7FdY44?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlOYWa+S9h5tTJdClvNdd3ZrJSAs5wV7M7B3M5+8CTm9tB8iTy1SNNht5vf7?=
 =?us-ascii?Q?vKQa8szlfVMzSS3SiLxzZOJDVKZ5q+mzXKX83czbA/rQxTKqrcg9RWYJwrol?=
 =?us-ascii?Q?ygFOnY3jrt3gAaSMEYZvJifqtpJdPkE98fyQ/92v0VFOt/IKqzl6oIDkxtYr?=
 =?us-ascii?Q?o4qNRvZLQ0Qwk7tUqQac2dNsdJen2HdkhPz7DKvnAsp0dfyckvPVQtB7XzDM?=
 =?us-ascii?Q?Zw83c2hRLWKg/euw+HpeiVTymE1ZFoxPz4YFOUHXjPwL3/quPY9tI738OhE4?=
 =?us-ascii?Q?gtmFekkgQjm1Kna+SXX9v0LidxtBav5lAccxCBgOtGEEpzJ/qlKib+44JzjS?=
 =?us-ascii?Q?VOYsFu/pim+7bb6wl4D6HzMIXpr7BZbiNkxOYtaOGTECVupDEnyXSp+qJcQm?=
 =?us-ascii?Q?oZVVCH3qxFXI+ntBNmQZL2mf8PAg/+lSZ/UNAlQ98L10T8DVTx2YX0lVRU8H?=
 =?us-ascii?Q?xxt1Pcadl45T48Gl/9E7Lm2GpZKtyJU8cZCQS2zO3/VeRm8Z9AcuJW5x2z4a?=
 =?us-ascii?Q?6PHxyPV4szzfjnGr7XVh0EfqkIpK1KOxCmp91BZwtvMUNRQGNFTiGdDyZ8iL?=
 =?us-ascii?Q?hL54Et3VRLXBkLY1P6HNCGMRbeKW6AipvtyDcj4N3VxwFJlTAReVeh3wuxjj?=
 =?us-ascii?Q?dibYeeTN+K+rC0VlCxRklcoKHScqpsiOyH9/YFJwsQOCTDKA1R3oH/SssbeR?=
 =?us-ascii?Q?UQe7DhpkWV+hnNlAYiAr/XPzTAAK9p3HpssYsexC8IXYu9cK7cUr8t7C6JFs?=
 =?us-ascii?Q?VYynnBemT0Wl8KHpp4/uT9TFIHdtb/6JgoYg8HBZaOFXUTUXonrzOQCjc6fD?=
 =?us-ascii?Q?2OYESKQKLKZYpvcAxs+JLcmsicwc+Xmna/yumTLkZ0qoPMxTA+nNXVpvFF7v?=
 =?us-ascii?Q?fDoxM3+X7IEpAEFti756v33utS434sZZMJOEVt1BKavy8/YX2pQwsHbV+/F9?=
 =?us-ascii?Q?Gh/I6lB2nlhQln4lAK9kLWfxsbd5mkBwyFzzXKxu9RFwNcjM/RmAU0Fi++SB?=
 =?us-ascii?Q?SAxgQt2pMl4DW3MDQyRXrTs7oijpx849UtJYgctS6C9ACu1FI0V6BDAkjvvp?=
 =?us-ascii?Q?wxwWcUfWsn9GhfjdhC4vkrFKFlg90fKseT59sKk4Ul6rb8zf6YnoWO4ctXbX?=
 =?us-ascii?Q?7AA2C7JUgwK8uEyLfYW82VkqFrrEYMPT9scexAIIW+Vyf1E/WSBwJCGKdsFT?=
 =?us-ascii?Q?eB9cGjStHQcqEGh37FVa08H9aMHcxBamhmklQA+ePg5GEb5S8Lx53bjs9Lrg?=
 =?us-ascii?Q?3Lt9PF0MRfbidREGagQGBSwzVYJ6cvpTnbc7fp9kZnG/pPeceebLpji+Zqh4?=
 =?us-ascii?Q?+pnj/Q9I8jj0eGXvg5Hp0Q//Euhgam800P65QPY5j9UbRAWON6690YGj0QFh?=
 =?us-ascii?Q?tdyyWb9cAXsPfC75fcjRprUCopk9BIWd2tnmpqiZRSt0J59OtR2m32DaDvyl?=
 =?us-ascii?Q?nyZzVSyNgmcsbYkvWvZ+OCRQinfmRuG90ej7ZIsTpiIQTZ7eGixDTJUkMd++?=
 =?us-ascii?Q?ic/aBGODQXLw+h3W4RHStqejb2aNFah9VmWSF9PWG7a3BhOub//wAkZjYae+?=
 =?us-ascii?Q?JgcAuYCMqL3kBD5fnKl2uHxJari89kB7Qrge+F1XOXujzaqQ2fMVOJo8NYlU?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0YxnIMca7NVMsFGgAeDIBDC0Yin1bdQcKM5EQZlqj2raLA83uZOUc0h8o/AwFyqT9MUVagJd9QZiIe1MDCimor+nFp62mx/Va3f8/Js29OTu54uuE9BovQrVoqKb15nbgwqM1nzWcFrxbsoLKzbhhGWncdDsytARa7Q9Z6qAElfX0C3pELYBS58Z3b+pnZALUvMv6gnrXhirg+3FBZXtyjEtyrhAsxWwG0MlG7pZ48ahsg7qWGimq9qzUUC2K5jQcvh4qmbb6uLEz6h082vlm+j351S+0wiz+38FQHTyCmCUFErffwYCCadCAfB1QWIMjz7lYk8RHvf71h+rGpW5I7DZ9RPV4n3O7GhI02amWDfTAo/tdzy/VcKDWtHXPZsYfnLgsZZB1WXalX5NjDcgs0CQh4LCUgHJT6EcRE+9ffvOe1mhed+oldj2udl5FfjTvdHzXQb7nyeEvdwqaoxtghjmV0tOkCc7iTioguzkyx2g3Y8Ntt/qz5mxme05BVynh4FMgov5Q45vqJKLSmfx/DObyUR4x2Td5icEdBwctEiKVCsZSg0S8BnXET2fd+851bU62EZAi/E3csqT/M9/wk1JORufXoGybz4HSySTXIs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92cda4c-4115-4571-7a23-08dd02698dfe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:57:33.4901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0zh8AffajqiJ/QkE1CbkVTjw4LY9uYvElV9VAEq5JdEeomkPNkq0EJ27pcrTutsV/TL5xMpyEnhg50sOkiZIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5192
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110130
X-Proofpoint-ORIG-GUID: fBqla4fg2_yOIxeNH5VHfUVqSYn3aPNy
X-Proofpoint-GUID: fBqla4fg2_yOIxeNH5VHfUVqSYn3aPNy

On 11 Nov 2024, Kris Van Hees uttered the following:

> Commit 52a18d35 "build: add a pkg-config file for dtrace consumers: use it"
> added a dtrace.pc file but failed to add it to the dtrace.spec as well.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Wrong package: it's a consumer .pc so it should be in -devel.

(See the patch I just sent when I woke up before, uh, reading any mail.)

-- 
NULL && (void)
