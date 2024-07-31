Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844E1BC074
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438816; cv=fail; b=Fu5o9FnKRSd8/Ze6DzM326+5TVdYMXW3Wpe45he+p74tdQaKmGLsQy5lXAn0DExAc+blMonFwp8GjfyjLVH3PVoJJMt6aKyXo1RX1LNEIkG+tx7Iu9Keah/fRStH1zKG1CQOwNMXb/1t24CJbC0CqA2bLKtXhIcVpO+uEaDR7xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438816; c=relaxed/simple;
	bh=dfpVzEJ/ysTwCWgDh3WahYvlxhnPhlCLJiv+NCEdWyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=lWK8LZC0mur2nydYtOUHH2P1rc3LXQyUbTmf5qpsKnGrlAqTpRj0baf6F3788X0fd6tTmaMd4FtKaWNxNkOYl5HZueCu/ykqeN0lZixVa4p2sh5XILsmeX4Ocd5Ckk1+KuQvQBpYer7s+ided86N2s99eb6KVItZUuoCw6ykS1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k/5uJVf1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gs79mT6W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k/5uJVf1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gs79mT6W"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V7tjjh024846
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=jjUprCqX9RnrDi
	q2voV3f16ErCjYicH3myorvmvsiwk=; b=k/5uJVf1wtuln5/HnIYy+FoIrI7Irh
	U205OZG+xfu+2A69h6Yoo3wB3teBojovTpWVW1w+n33JERCpGS6F4Xydr9tUcBhf
	PhzD33hAH8+9gF+2G2BuHZj5vBNLZNzdk3p5gN0qqGIiDHuzFxl/vU3+mntF56Nb
	T7NDIoDcOh0RJjSd1ISpEda8Djvm2/vTsQidQN47ZJkDiL7kyJumxPZ35PhkXy3V
	oj3ot+/Qxf4ja00PN6DdVUxzitaKo9sX6+/c/KdHML3+BXM5C07kIkHriEEEMbCZ
	8gZPBTJLFzdOHSVf1nKfPHbyS1lBhUQ5nk5JaH0TIa2WeibjCWcCc0MA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs7m1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:13:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VECBRQ036902
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:13:31 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvnxvagh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umvatOoMdUwCohxWGSN5OQyzy6xSH9qIM3TLLMGDNwn6GUGYaOfIlMfjoq6FTNTiEUeAxTBWclG9MqSHPyrKj9/6ei9U6dyaN534QXL/fyhoVLVA5l7aUFBITENnxKZFs9ibqJf95HnOuqwsVUjiJsLJSeYypV9hXuGjU5Tbxv0MriNffFGpiCQUX5LWa8Scs6hWWbJ3CMJDN4r3C8/ITxB7i1RZpUuaUKi6/oCE+7gAlil0rGyobgCw4cea+Js58zkdtQF7voj8YsY6oV7frPxGMauGhjD9o3zOvUtWEze6WTSE9b9lV5jnfbN9MXU2EtTD75+ymJ5Ag8aZZ5FToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjUprCqX9RnrDiq2voV3f16ErCjYicH3myorvmvsiwk=;
 b=P9pOs0hnKCzhVnPK5P1JladfRmLwhFsT/dxufID28ZAaD7bZkc2046S6S/Z3TJpS5YONXOPBnJYm3wUqK8S6/0zwuyPVjCNRxiqWGg/ew6hGy04xPFUdqqWo3YOfQCz0M6Xd0/2u7EM1WPI0dxxJDOniZQ9s9B+DJ4KXLKRgS2yRwSDzJiVCziLUlCCpXQ/i8KwOv/LrcsFVeoeHLAad0LRu45WRvtNaeTzlEmPUC/8j+WX7FWcs+OUHtG6EOa9mTQn8NV98Cx5b/vKpG+bJG2XkTTFT90Xip6+1VoIeznJMNUM+BnJ+RJp6syKmLHxySvFazwFKoDsFCgBuSVk4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjUprCqX9RnrDiq2voV3f16ErCjYicH3myorvmvsiwk=;
 b=gs79mT6WeUO8pihSqoBLdekBndr7oSAwLNM5lMjbfBhNBLV9TCci906P/04uiFsU9BRJss7Fgr0TUE5/DuDvTOw09ihmRqXWdWcaFHeXKTqjfB7KlhSyKG/6cxHvoIKgLiJwO/lylNskz7oyIHTPeckjlFs0LhfuZPI5jDGZX+w=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SA6PR10MB8208.namprd10.prod.outlook.com (2603:10b6:806:435::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 15:13:03 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:13:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] test/triggers: ensure bogus-ioctl has a
 reasonable fd limit
References: <SN7PR10MB6287EE29B21318FADD0A8DD1C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: the only text editor known to get indigestion.
Date: Wed, 31 Jul 2024 16:12:58 +0100
In-Reply-To: <SN7PR10MB6287EE29B21318FADD0A8DD1C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Wed, 31 Jul 2024
	11:03:30 -0400")
Message-ID: <87cymtoarp.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SA6PR10MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: b5340abc-dc37-4f21-61ba-08dcb17345a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sXJrP4F9MWqYZhKNzfr+NIy/d0gLx6NlXP7V70O58nuXmIajBN6gJ92urwB1?=
 =?us-ascii?Q?Hmb8VpZNe76EqlfyIILAizr1MTX56qsY8bl9ttsdnJ1jxRiCGxWXzN6u/wT2?=
 =?us-ascii?Q?LQ0ETONiqhPx4Gd1Mx2pt6uvhLAJv+FWH10JAfVT5xjeWNSlj/zVpGT0yp/v?=
 =?us-ascii?Q?Trx7Lyr1qNBBcecAOJZZYR9Pj3N6hj5XGbImWaNJDAzNjAkTX9fQDVt4HxH9?=
 =?us-ascii?Q?VlBjhxYx8tzH6qQojEAzHg468ntgghSRUGmxJdzaFjyaiw2Q9wtjXt1FxIBq?=
 =?us-ascii?Q?jdOgUdHEa2/fHIU/qMjDVkg5UfA3IFNB6krPaAz+rC6kNl/x94l6mcrzPq0R?=
 =?us-ascii?Q?xyRVV0wHL6Mk957lsLfNfdVI1Sg6iY/awWqooYaYlzJemt0JxREBchml6Dll?=
 =?us-ascii?Q?OMEeUsG/dgQ/Gnb38rffSCBieaRXSP5cDprTbGK/7f77SB5vKC8rezDqzQ9u?=
 =?us-ascii?Q?hbmcY3k5BOoL1GTnCJrAc96YD3U4sMJzZH84wt2GIyciWuaP1z2L8K4KZmWZ?=
 =?us-ascii?Q?E2GqQfXKb9+LCSgPZdjK5zUCI62nPDinyqUZ3MoRZ29kzwecmD1V/hVksg0g?=
 =?us-ascii?Q?Ro2vPqN5iThaNFYc836LBz13BEexwNQHr+SzoqF4lvEU3GXHS0MgwbDa+AD+?=
 =?us-ascii?Q?mFQ2uolreq0Ds7nABdxktku8VPwww1/JSMHmZfE+2PN2k72KEgoP3CLRensS?=
 =?us-ascii?Q?MMnTuDm2/vxgbqbgNNiEvyj+3JQ9JfFnybZB773IregfyEUvSaazot54o8xZ?=
 =?us-ascii?Q?MgmlNwEUIdBJR9XUIlHmbyjz1tl/yGr0tLRz0ptt5SU1mzjQUKFKtRNXfnSV?=
 =?us-ascii?Q?GncwKM635iM+VCpvrt20PKADC5gWIL1aVbZnEmRTBP/G/Sl5SLq1iTUNXilx?=
 =?us-ascii?Q?CgJnzf5YL9v+rmEvTlphfVTtWRB6Lh5X4zBLb19OFTvkhW7gITSuYI9tMskH?=
 =?us-ascii?Q?A3beCBcFZZFjC4LEN0wdiarWnwnfsiEzCX4FpBaofLWLQu80aXjCN+MwNfpa?=
 =?us-ascii?Q?Sg1Jx6d/jciECMLmmfz0ZNqj7v0l+vLISXHxL6c+uRS6Uo8C9n/xH0Xtww/r?=
 =?us-ascii?Q?2R1I895Di1rMJ6kO6ZPVw5MlqPIumiXWQ1CVe4idT+o+t7tdZYy7U4GmeJJp?=
 =?us-ascii?Q?Uof/SJrp2Sp5EqkDH4l15qZ/+TWmxcErWE2ha3tbYNE5XwbfuUC2ZOiTRjKK?=
 =?us-ascii?Q?zO7c0UKMJH5d9WBHb3grW7ZK+b5wWhOfnAlmOGJj3M11z1T5BZWF4pyS0SUI?=
 =?us-ascii?Q?0uErRXhTKnXj7DVoE+377bM6gYpd140Oo96OaJPqcntpStlBOJQ5BeEGvR8+?=
 =?us-ascii?Q?8gQlfyuz6Ac6P37ea4WzvpGoriiJEolmzrj++7OtpE8BqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EnHANIUsIXMuyDzVPt7LmhFfk26x3EueRnqVNJM1h0RMSBn58eJCDRwQ0fGR?=
 =?us-ascii?Q?tHNPAb2JHRCsP30/dX5rfbFNJiwahIRvhHPH1jt6EzT3qdozUzsm70TMoEcx?=
 =?us-ascii?Q?4dbytIFzQpD2lK74DJFLBjPInyj6I5yC62M5EAvrePYWEWIgrmO4W046MzcA?=
 =?us-ascii?Q?ZxlFdFs/XV8Me6PXeeGZEP6Xhy6Eguk6JpT3RgEUzS9ZWoowxbecpcHIHks5?=
 =?us-ascii?Q?aKu3KbYL0JuxgMS46dq61T1rw6SC22ksDrUb4XS/62ZcttYO86LNOxu4xLRL?=
 =?us-ascii?Q?busCxyHmbJ9SLhT9GKWdoeqsJJ7n93ARDySohI5fjepaqLypdJul8nRwyN9H?=
 =?us-ascii?Q?QrxXWVH167Pw+m4gbvyV7H0Th/acSFs1Y72TkVahKfq4AeYWp8wthTxUZny3?=
 =?us-ascii?Q?NvThWKhWbsa4gNpXL53SKk1BM6E+VDyEVx1jQvAxcqnM5pxkYDDuc1804GPK?=
 =?us-ascii?Q?b8VCg4WEKh6WoHXY9IuG7eJJFPYKCAlInvSrhrLQMV0z6sTlgSAWVmI0eEV0?=
 =?us-ascii?Q?kDCNYDvwz11uZT+JC6HH898RZqE/RAl9qmDYWPzQpjVsOjZmIlY7e1God6uV?=
 =?us-ascii?Q?sby0AbViTrr6sH9I5b5i5L4E9iOr7nMUlPzBH3J9MSf+PWukSBJhwwxh0KpN?=
 =?us-ascii?Q?WV3ohg6wgaIPnSaS0MZ2mdfQ8B5g1YC5BVeS2Us3UmyAU/2a2SAMv0auF2RE?=
 =?us-ascii?Q?fsAoo9UuMbnjz+X+kgsNp0txygkojD6/WRiYpZ2kyyvAaMp3s4l5aSNS7cNX?=
 =?us-ascii?Q?o71HtaQl97ioaFeHOvu33KtGdPtKJ+tdEQ3yNumV1kMxT5r987YhcaCj7KLU?=
 =?us-ascii?Q?j7jA/aWUXLqnu2WSJ3KbWy1m1bhV82K6zQ8Sm96zkqEsAdvuISu6Y4ojCYjX?=
 =?us-ascii?Q?ZQqIILX0X7BybnxhIkISR3SQfdxJ7aM6Vj5jlbrTyYYr37Ya50yYwz7kWVNh?=
 =?us-ascii?Q?GL2akdJePQxyLTS86XcDyilAMPFtvk3yQ0Bb1KcLy4Xnp35pDbg4HihrqCpd?=
 =?us-ascii?Q?hK+GHtghwE/PyZCEKD+vUTHNpcVwYrFiVcxYKJdn6XsmYwRP6qj2cgubDLLp?=
 =?us-ascii?Q?LmKQKXMxPXQZzeJOqOV7SmzNH9fs6axseStuRnTeiHsBgf99NJe7+4m+TnsX?=
 =?us-ascii?Q?j3JpmCXYQgWIlVbWVt1LcwB/GgCldUsePkmgDR9O2oGqxLfhgaWIy49pPH/2?=
 =?us-ascii?Q?Mk/fP9V2G26F19cdok8Kn395LBosV9ETnm3AvybBIEDDXj19kNZZo+jg8Tkb?=
 =?us-ascii?Q?Axe1GPg3uP+87Ly9DK3xafwugj8+T4TsYmFVc2ZSok8vZHkPHZ/fcp2Azp6z?=
 =?us-ascii?Q?Dlqke2XSiMzYZ1V+pWdmRpzv+pj4trUIMN8RW4RVYn0a1NsBlGg8Za6Jd7pL?=
 =?us-ascii?Q?cPQh/jPy2+xu6qJ7ijvLpON2TPV/0VuQGgQoMUUIL58gozoz7DBkIvC6S7ZL?=
 =?us-ascii?Q?qBEHO2O31MlM0YeO4MOivK3gGTTzFiwjd3urEGhoGnBq2lMm2Ns9ZcQa6VHm?=
 =?us-ascii?Q?Vhbup9pcAP/9XcVAXPaIszQI0m4fK5jVkKPRiL4DwyvvRjRR0pPCS3PWWwh3?=
 =?us-ascii?Q?HbgJVOp76Bezysiw6IbABp/yFzcH7l6oTTOdfk/qggjIveFrTv7BHVQx/nWb?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gwxWbPimJegYyaCk6Y1x47nxb26tCq/aS7OAwOdlkwN2QoiVpFcyhsuHV/TT5bYEks5Oo+A3uiQMldS/4V9hkAIBvnV4YkvEOG9ZA5r3s+dzkObbMZwOdqp55YRTGId8ZBAF7vXAl7nHA7x+eXQo61+OP3DPVs9HX4HR0xwvnT5UimmiA1Zz5MgqdjMs3TNIZ7pPML5o/K/oXolJQXnf7zmgwyXr5pLfEog/+nobES4xLekr54wlRooP9ASVHySnb88xlktO9xi6ubciw4Wq2bQuOWHzsb7a/HrjKGA5kM1bhoUC87KJHCLpD/72HDhhQHexFWfmH731t+ZNx+VIaYnuFJoutRbf5Jx02cNYfgvoHKonXYKlClnAMeVbZMj2+kRcz+QOPLU+33b1Tcmk3QlRWCm6GN9caSxypGCvEdnxBeebMgcCyc9K4HSJSaE8w4eRaOY/wUZ6UhYF1/bSl8ROFDKQ6oPze8WkY4xeKXW9xTEI4QQ67n8I1rt0uPukT1sZZLkc7N3CbwJ9onOdVWQBdOw02RherOgxnzc1IoqfG49fsk7+81zRf5SQgIcViJqqoyy5LfbJLPbJNGIIOaQg2wUGzxvzz7kBD2xf5sA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5340abc-dc37-4f21-61ba-08dcb17345a3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:13:02.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awLh8psMOhSYuEaHSId4bYTQj6eQkZGTPBK1O86GLmO3z+ftl0YYq9NB3WMqTmDvaD2z0mdcdBzhtqV18J+e4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310107
X-Proofpoint-GUID: dKBBROIgFlLWAFo9cwPCzE7Wgqai-55B
X-Proofpoint-ORIG-GUID: dKBBROIgFlLWAFo9cwPCzE7Wgqai-55B

On 31 Jul 2024, Kris Van Hees via DTrace-devel spake thusly:

> The bogus-ioctl trigger has a loop to close all possible fds, and it
> was limit by rlim_max.  On some systems, that was such a high limit
> that the loop was taking too long, causing tests to time out.  Set
> the limit to 1024, so that the loop will end in reasonable time.

Boggle. I guess this has grown a lot with time :)

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

(in practice, probably closing the first three would work almost all the
time. I can't imagine any shell weird enough to leave a thousand fds
open on entry!)

-- 
NULL && (void)
