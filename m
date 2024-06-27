Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8AD1C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466549; cv=fail; b=auvB1QhL5NJi/sdXf1O2OceuD+uHK4K7rmACgOaIZ4HG5KY3Wf9vgTM7jMOtemCSyyQ7bunmkhi61aCNVWz43/AY5WB6VeIv0X0QZJ3H2P63CRdbHD8tT1bHCXRaqKcUGcL2Lt4T1fF0N84HyhfpSD0z6xrOxydfSse/auTXcu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466549; c=relaxed/simple;
	bh=RglCRkweF6VM/+CBq4c7aPg5xdfqREZWiu8R67sSLuM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SH2+jgeGqVnQzE7iiScinkx255xQLQs/xmZ+aR3gKmWnupe2jzk9wjZR94FR/aWNxscWgCgsieAcKARCysSZ0Gi+/MB5KJZUIUtK226DWKPiy0CxkzX0co01bBDG/D1GgfiEoYwYJ+C1htYxYo0aljnVd7MvX1IDu9y1RwH9pMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ontk8/9p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z/bsaDqh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ontk8/9p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z/bsaDqh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMo41022547
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=pQ2Md0SGRQxgWD
	t4pz3k+0fMq2cE2cu8vRIDsdUnCmQ=; b=ontk8/9pB3p6vJPB3SI2fhxa/wQxtI
	qS43UYVkSC7C1tV51R4HvVr3x3PyzjtuhUXqYhmK0TT2E7a/5H87VcnApET0KUH4
	3gIrcWvOAG9wLGob4TF74WwwtD32d21o+VjkekkUq17ZfA1qIjx28q8v6ELM+FZC
	zfLU9X3Y6phd0e2UkQJFcZTfJ7NAe+rU5tb/sszZtW6qc2B9Z7/ZggIKPqUtvoiC
	iCxM/c5DMaxaLTf6i72HLDJ1DBEwDg3gwaTbLbjlJT7ZfpbMWco5cKhiKN0rLG41
	91TfYcZ3IAZrju5AKb4wlCJJzCSyg7f9uhNH9u07Y+wSBx38zc00komQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70d0wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3RReA001288
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amxcs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKPS2NjjWJVJms6D1bbgf1PeYrzVbZsyqK/NO0/EbNMsrudSkcVEuyl2zaUk3plycilI5TMgpaQQQJbnl0S9MB8VSqVKd7CZvDKdiZFkJNwWEWiM59tJ9ib7z2FMlS8UQVCiU0Z9F4qPpy3fL80ts8liC3u7Mfduar1ETy67+PXDdlLTR9YzJf79nL9hWUFJyGgwjq3t6ffByItfKxwTHD+Rcx1mOhklxpPob6fpt9du+0rKjKyzQuyHzf02C50eEjB+LXrVfSi3XcUhPALhB7KW5Wtw/Bgyj9xV5Ab/9yf4Il28+AXb3mwKWaYvEmnvjzdexlkRGX/4L47rF9UXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ2Md0SGRQxgWDt4pz3k+0fMq2cE2cu8vRIDsdUnCmQ=;
 b=EiRTihHPwaYmgbThEbMbsJcagGYqfyvk7WDU+x1S9IdD8SFOEKxN+RijfBRCWyQxovjjDkyFIXwBTjzWQrpYGRSrRw+0rjLDTDOfZEYTFfFqvEwvd2LX/5ZEnOD0ak8kSyBIcES2vqaMT7p+UqPmn3hS5Je7uMVylDYsTk88vXK/Zr+pRst9VvUVeT92EhI6nX2dRl9upNOGwRaP3Hssj9FqPo/x/ZNjHZtjaBPj0hf+NrjlIKD9FdOGRVrb+chhCj/Ru8P55/0aOge1hRuLOfm55OCZLsO6Qjad7KbX+ab0U+bau4K0IkjVe/MwNfa2I7/lgGuIHdYgt87P5FnYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ2Md0SGRQxgWDt4pz3k+0fMq2cE2cu8vRIDsdUnCmQ=;
 b=z/bsaDqhpHsO4NvM3l/NjIeELmwyE5p31HQ1C28Xsf9aSqb4aLURmAq7lmVWpfodZG1EaaKhW/bx5W9F1EHV6ch18zDpDWKHvZIGiD3csf+xoPssM1wK/+sMZYa00H1C71cbZM7dbxDo9AUJIp9cX0oeVzkRZUrs2p4+NE2VbI4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 18/38] Add a provider-specific probe_add_clause for underlying probes
Date: Thu, 27 Jun 2024 01:34:35 -0400
Message-Id: <20240627053455.21567-19-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dcf1f6-9e4d-4d85-b64c-08dc966afd5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5fw8MyCJcvWoeAFMFV89b1vlR54XzM+sldpYOIApITrP7/N4UhPFbX9ssk6o?=
 =?us-ascii?Q?ZgP3Svk5WeUaKuv0Wy/pBFFjReyMLHcggpcmk4S8B8I0Y2cDpG6hgEJdxTqG?=
 =?us-ascii?Q?sXp9L6PwQKr+u0htIR9xSDG9fnpktqx6IMItLAihtFs4wZD8QUebavfNpqrb?=
 =?us-ascii?Q?i6mdbIjh3UnYUtKH+sYUtrAwv87LkihOQAK2gKblFrruzfC12Vi/jOa1zM6V?=
 =?us-ascii?Q?Nu9b6Xak/Fqvpnbs4afDjcqNYGBCp12ILA5YjgpmxO85plvyfBkhjY6lbs0Y?=
 =?us-ascii?Q?0PLl+4+aHqZifVJkeoov2bemvDSlfU96Eg4GbFGwGurd28Jk8KDwWHp7iTjH?=
 =?us-ascii?Q?ip3rwXd1vwFzMHzgBBQF15GQxoUcMkR7VzbNZnWwq86+Q5kW2pD4BtVI4jYd?=
 =?us-ascii?Q?jHqi4sUI1GTZnYA/BAaYpu+28eEYvHmvPS9MdIWtvQ8oH/xxbDpiEr6eWt5p?=
 =?us-ascii?Q?hryLxDqGqGyASgS8ynLy3mZMMLfMf9K2oHarCCWzrEwLFR2FoI3qr8/4l5WX?=
 =?us-ascii?Q?SZRusIVw8Sa5l2h8CXzQBWzOALEIuaAfu9IEBP26J58Zkv7A97sfDcmwA103?=
 =?us-ascii?Q?AlFVfSZCVtqL/OYqzG8ti6T/Us72tfB0u+C3xqs/Gtd8pLxyC4aDq9LDJvVp?=
 =?us-ascii?Q?xtjAkZ61dVn9cyNipnPIwf2gSYVaCga672XNxU0pOX6z6yN9tFLZVBNfVRIJ?=
 =?us-ascii?Q?BfglQsflpipF0MJVxtIVOt+HYvgBi2Dgrj+1SG73mV9NX5OPI4YFAZf6Ijgo?=
 =?us-ascii?Q?0ecX6o1TqaZRxRzUJtPGTcSyWoioU/Ra9EfTslLyGbuC67qm19IaSOV7dXDp?=
 =?us-ascii?Q?dfNt/N/vTUEXYOY3Y8cGRCbYXoR9pqJHGptJuIy+CiwN7qHqqJXAe8MdGXpc?=
 =?us-ascii?Q?Ot28PuP3awqky151P6JXqKcZXDQraPfSDtzXCY2u2QfFHWoKn4w8iEF4SuoQ?=
 =?us-ascii?Q?WomPmE79bNAqw8MFhWD8t3yvlCgaQm6PcwMqDKmvVkhcu46Hwp0jpERXO2pZ?=
 =?us-ascii?Q?pB+ASUVNUvp4MvH7KHE8QlbtAMNShex0p9EnZXdG8AZTu6MiDjS7AD2cxahe?=
 =?us-ascii?Q?lOgZ/fDE5+xnx0J5XMHAWsJOP6JSxLTCSrchjviUxzU9Fc8AUg7klZAMA7yM?=
 =?us-ascii?Q?PV6LL+eVDDftYEoplNbs0Q0766Xa3rMgJqQhJSN66+gJqojkHVjBShY/FCxJ?=
 =?us-ascii?Q?u0kxhUuhArC77kNeY+nrPPjJolWCAvb/DuOHEfP2VJxQz08201PYxklmcqrE?=
 =?us-ascii?Q?MZ94zjNfx+tSzWQ88CiLp0mLO4KOOqAvfeWCVsWqESPQVxVN2D8+aBcGReht?=
 =?us-ascii?Q?UyaxFfSmM3e2amDErkM//x6cC/N/SJpMzVgnEoeNIsxgdg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tu7Ej5cRtPtcTZyyc3Dj2/WArdmp4ICn3Evfbo7rLhn+hMVZ6eQ2EdyepMYW?=
 =?us-ascii?Q?oaUyQcfToldJ/ZGbIZxWWrpaurrbd7wzFD60SeHhm1B+IIXoH7isS2ddnoGQ?=
 =?us-ascii?Q?9TadwvkGX0FeIxm7g2gpgx+nclDh0PkfWNdw5Ht2A6PzUmM3esmyBg+JMz1A?=
 =?us-ascii?Q?fxQnxgKms6ScOyUbfXvfZZGT6tHQxTdEEQMqSRtkcCOhTkSNtpjG78Xm2uWD?=
 =?us-ascii?Q?ZYP2Y6mM7Fg+u/L+fKw5yqF9BVmqRRhD3/pktfgJzuicrd8U2708LJZg7WTC?=
 =?us-ascii?Q?QgytXfaeJIxSRxuS1g+ZTajM61zFJGGPtCTsYZ33XfFxl+vqKE+Fk5JA9N/K?=
 =?us-ascii?Q?BywcVsIf0KzdGaU25oBHK4PXHUJrM8D17Q7DabXJfMsFLUMINkUfQnezVxLX?=
 =?us-ascii?Q?9zAQzBllkpDqZljyysGEY9RfwiQDe4PCeG9nMHvQhrjVV56gzoUGjubdjUdd?=
 =?us-ascii?Q?OJbqHrjk5p/B++NSwwlWaEzVGN6Oa3jXliUrWBzj1HsTcoDgVmApgO8EN9TB?=
 =?us-ascii?Q?fZKqNSKVDLhdsXYiWkgJqVnNaZTJh3411emEQgpjT7p+eHNxEJuTqUFf/oHy?=
 =?us-ascii?Q?VWBe1XaAksOX6RIgCMIQf2j4/z0R77gdcOMSYLWokZ0ZBfv7S5Df2pCeYy0C?=
 =?us-ascii?Q?wCkX5llcRc1AGdcr3B/yoKQESxLCuryF7ZwFB1Spwzj/HuU2MORibAIZTm5u?=
 =?us-ascii?Q?n+ZWl5NZlTYzk0tqsfisXVtAGBBk9e2BAYx2hTko2jTTw4xaIhs+a6tN90aL?=
 =?us-ascii?Q?PGkVxOzF/bGRLBVmaFVIf00S2/3l/ZBi+7XtF3DQAy+1hAOAzor4ZsUGmcN/?=
 =?us-ascii?Q?hdqGHKXQTSNHi5xiLSsbrwqErCUY3balq+fbeCdgO67EHz4+3y+gBWWX8pHK?=
 =?us-ascii?Q?hTFyDHgXq9px8rsHsj3Crl0qFvlwMicyfBiLQfx3HzJZjA44E8HAhvlFw74s?=
 =?us-ascii?Q?8HqjcneYPTkNgeR9jOMtMx7PTsS/+qqVuIzq9eBjxQxDpS6m9jqhsJTujO+b?=
 =?us-ascii?Q?xX7Q+b6Hym/lxPm9gtb0Rc+CGi0zHRLrqg57YNk2Ux02Jha068PaMbMtKo4w?=
 =?us-ascii?Q?MT4M1ls8X/cvX0/H41jRilhnOTyaJjMte/oUR964XUvAtWB2PC6ed/ykf+Tb?=
 =?us-ascii?Q?jXVQD2HVj5w6ipsM4t8sqziRNXLbTjXJkKCLnAFGtHEUbpLbfzfftNeMb1Oa?=
 =?us-ascii?Q?DB16yOjRsdMT0nL3U4SBmsHQbGhBlcukCQH0+QJ7+4mhWouwdf/12aAaOAiR?=
 =?us-ascii?Q?jCkLFcflcTFE/qfRPxej1h6ClQHlJVJrtoHtBZzC0Tuwhi9HmKASyjU4csBo?=
 =?us-ascii?Q?BoRATEQ18uZKez/QJ6nsAjc6gjYd704FlhLQ5T2lRGXaGRDhI8aEKzaBxeHA?=
 =?us-ascii?Q?aPewGyZTOgYOxApEJ7RJHWsAZaA/vj91/R0wz5hzbaYGlMjbVoRZ+OdlSGV8?=
 =?us-ascii?Q?CWLR9LGl6gVr9kdHjDTHqftK9noYxtsgc+/g79erPHY4dH8/r3T0t8xKnF/9?=
 =?us-ascii?Q?byQtJe5fL4btPtJPInzAbGz816yHugCyqWKbtIEDxCdxrKaRHcQrCpnSIcXX?=
 =?us-ascii?Q?dq5QDgVVx5vSIKLdCKf2HXzZxpNbOdihPndks+9v?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AgBj6UAyw2G42NyoaPTXRBkDxs11GO7en4i1J6RsTcMt4PVqargDsIyTXCnoBhBnRPqOXv9SFjWV+7e32a+eGMW6U2LpTV8IhWDuAx7Qa8jTqu1pYgcELey0JyhHvHJ34EtZprt+Lc8gj0R/oyW/DOlHP4x3Vjn2/gLieu1vZPw8w5pXj5L9Ah2jjqE/JdMdK0AL/8CzdxEjMQQcxslEBef2M5cEl2Rkd2HwsTMawK8BTpL3OYRMJRXzMIM/BeWBnOTZpLuO6nZUpedp15fteQtNCEpAXLwM9PRZy6tXhfJil8CVOUn9/HcXpAdqR7b9yvpc62++8g25XpZ3X0T8vXj9Vk5QPXoSi+/Uh3BaFsTM1Vt753f3EfLP5ZAkNPw3oLvB5gix7bKNsVeu5JN1ifwSLHDwjD8aiZ3E2tSHR/BfN5zb/+eB/PNshEzald/1Z86BBG09lWQUiI1BntW5BY/AmIhqJyt0s2n1gIFeXSe0ew/NfTqffJC0QtHVFvD0mQHVgXldNJBYiI15rgqxEwrPclccl+1s6iNRGxpaMoXU8HoPAZLEcYfwEboycDa3pdDVcqQnhLNfGQF2pACBe1hsemy6v9lmbLK/NPl+Ow0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dcf1f6-9e4d-4d85-b64c-08dc966afd5d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:44.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy1LKXU1cyKqFL/NlkdLNuvXdicFObLhHQfZ0+2NeDoyBzb4mCm6u2vZXLAKLh1iGW1Uthu98m1Jh2gjo0gxSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-ORIG-GUID: KAUlbfmFpz1-ftnxCxPJDn6EvsxDiIuA
X-Proofpoint-GUID: KAUlbfmFpz1-ftnxCxPJDn6EvsxDiIuA

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index c77063a8..5dbd75e3 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -129,6 +129,38 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Add clause to probe.
+ */
+static int probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
+{
+	const list_probe_t	*pup;
+
+	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+		dt_probe_t		*uprp = pup->probe;
+		dt_probe_clause_t	*prev, *pcp;
+
+		/*
+		 * Check if the clause is already there.  Since the clauses
+		 * are added "in order," we only need to check the previous
+		 * entry.
+		 */
+		prev = dt_list_prev(&uprp->clauses);
+		if (prev && strcmp(prev->clause->di_name, idp->di_name) == 0)
+			continue;
+
+		/*
+		 * Add the clause.
+		 */
+		pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
+		if (pcp == NULL)
+			return -1;
+		pcp->clause = idp;
+		dt_list_append(&uprp->clauses, pcp);
+	}
+
+	return 0;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -811,6 +843,7 @@ dt_provimpl_t	dt_pid = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_pid_probe,
 	.enable		= &enable_pid,
+	.probe_add_clause = &probe_add_clause,
 	.probe_destroy	= &probe_destroy,
 };
 
@@ -822,5 +855,6 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_add_clause = &probe_add_clause,
 	.probe_destroy	= &probe_destroy,
 };
-- 
2.18.4

