Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0C2D9ED1
	for <dtrace@lists.linux.dev>; Mon,  8 Dec 2025 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765230820; cv=fail; b=UGIgHMymIDIQjiO6tCCNJQoWuDqG7faaIcJe1ESYyDydqyMaBLWnQbAJnSdP7936MOMXtRoqWXUZuyPRTSFX4wIfkl4QJOjtygZ9jym97w6yDSe/cxCBVJQj8o2NOgd7Q+U2cCXCenrVJ0NgOHAjw8af7g53RlwA855KGflNYcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765230820; c=relaxed/simple;
	bh=zIR86xzV4uDFEr68q4oaEg49pwejAduhehWOsuDS9Yo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=p8AMzahBurb8evtH33H2ughZxZtPYz5NvnT0MeDw1yYQ8+0tFcDfZF4SqMeVIxW6g8xm8Um6YUSTxX7iuu95EUGXKY6OZUzxgLNOlTgxQq44MFHt4uKCIoRBhvMGtEJ/RknbGZpgFZGZ4GYFcuJx8H5R6ltNsJyQT9x1FiyqL6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PnXkdaDR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MPDSek7d; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PnXkdaDR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MPDSek7d"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8LNG8I3414953
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 21:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=PS+7slKxGyuTkEKLKcbtT77hNkRhhh/ZOgDN24bIyzc=; b=
	PnXkdaDRZC5r/kzY49ckHf3FPnqIX09gTYU9w2jpTOKtE+fcf7sXNVMKStORzaPR
	u6uflPntxz2cNaW9NZetUJSbM6zkQtr32uoTLx547Alqco6wm8IitoJRFzB7UN5X
	v+NQQ/pOuT82ztmaneCjL5m1FQSbXqTUNP0Ys5eZlia3PJbz8Pog0wLNecUbZeRa
	8JVBIzuqoNozSo39n5a+5CkS6GnpyiLra88aD/ET6HXnvb7ftvYZfpd8TIWjJ0cG
	MrVCOA3OtVMDGYo/LdbQV95xhB9AO3iGAfrq7yvPKUzajbwrJw2Q3HklS6e4U7LI
	3Gc9X3QQ7G6leLuOlRXNTg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ax5mg05u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 21:53:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8JmEdY038117
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 21:53:32 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avax8abb4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 21:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usbkI8G2eOucZM07d1Yrv2mjmGhjQvhVJLIYLCuAREbEOelLGQ2nrbIUH2Tl+HQxxU2sFA7Za4Y362xMULBl25t7iIodHZwLFvwX0Hyp/Z8PsQFwigsK5ONGcRdTOMO3fakN/AN3fR9WX6YDKpxinuULR/HXKDgAuJ+P5yq2FsZryTKqfAvEm1DFKcHnSogSIyQqCSOLM5jsu/xfUTDtgigt9ug24offWw09WkSYds88jJkNmgL/y33xrNGbez9+3VMN9Q5fHLqP69pb/q2ugTG+7xFNrafd34OedKlzykWZUnZvnsy/pHf8YVOLEOr6iDkNX9XcAEeLae7eVqC5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS+7slKxGyuTkEKLKcbtT77hNkRhhh/ZOgDN24bIyzc=;
 b=vFfpLFDF2JxZyQIfVBRBK4jfhwwo/10Pn4t9c9Mfke+EOxshuL4Qzb4JJbTBrLHW3pudMk2rSOd+XJfw2zbUXo9WTp3XCFdkRkOZReR2gZ5wcCaRb6aGfowCJeBA16Lu72FveD/TreW1RRJW0nEiPSg1RE6ZjNkdA7ChWtgClv1exNZuGWo6yFPotGRkf8lP7IgAs5T+ZNlwH+6S5KjQF1OaXN2KWCE9YHHGFZA4CrprDUEJFicUNd3O8DCtAStdwJhHH9vBq4fd8qOfmw0ptbQwbNsgPRwmaIe5ztlrw1kojIJWhhozVK9ukNQGlwE7ekUbEU+2XYHWSLHQ9l0BhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS+7slKxGyuTkEKLKcbtT77hNkRhhh/ZOgDN24bIyzc=;
 b=MPDSek7dLMGxMr8UI7eaUaBLUeO+IFqRWqvZU9BhiXC1nJ5Wf1QQNcA/Ti0ChleNIt/8oFuBp3dbnoxDtdkFiWhcG6tIhInATY61OrxKcVHyGpbLg4NdQzrj3Q2ZBeN/oZAdbEyEmy5ijOQW3kRXWFO5UT20TR00izymKjMfBoQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4491.namprd10.prod.outlook.com (2603:10b6:806:f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:53:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:53:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] doc: Update the sdt provider documentation
Date: Mon,  8 Dec 2025 16:53:15 -0500
Message-Id: <20251208215315.5346-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4491:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdf0c1b-ef2d-4f70-7fd6-08de36a43281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8y2TkELc4kP8dTm8uyomLVQYfgWQcaLavode7vUlgAhw9D0Jblf2+Ozm2D3W?=
 =?us-ascii?Q?Tm4OskIz1wRujPUvmaOD67KlDQxi2i8NjZYaz9J17u9bM/5nNRP1ahHRQudo?=
 =?us-ascii?Q?6SBB6Lrg4Ia7JZhQJ8rWcZAPp3egWwAbczBmSfnl5cDNvLw7sMGQ78WxkeQn?=
 =?us-ascii?Q?Eh15IngXpyncI+3hRGSESpWlJJuPo1iij0tRWK/we+6OOyjmt5lTLdY0UJMQ?=
 =?us-ascii?Q?k+jWqigHJrgYnIaN6sv7RyAXGoXmDg9GD+ulLuhEwZX/jNs06lc2KK65jJeR?=
 =?us-ascii?Q?A1gnuQzGMPJ8W18rHsa3g75zqHsRiC0QWoCO+JwIUuyW/XlfUNe6bh3jgH4b?=
 =?us-ascii?Q?ZBXr9JQr5j4KHcvt6k2QRuLW1J3PXekjYt9V8/uKhJ6o6aJ0I6BZTu8izlCj?=
 =?us-ascii?Q?CbXMM1rnHH2YV6nwIZMZRUmjN3sdhFlTKxuVADd/+PvfWO2lQ7BlLWHNsoZJ?=
 =?us-ascii?Q?L8g8hcibRDiizqF1tUY0PD1lbDaFaVxFGj5RWobqi7IBTY6T8/attWOc2fm0?=
 =?us-ascii?Q?lQw1e0Z6kyfKHjuVMqZEhnmO9No5bhfDwg+h2KvuGogqkczkd3AnSmVI9xLa?=
 =?us-ascii?Q?wrYIYteFWPbY+N25wX/MC8Ii06NmOxbV+Tz16jw75mHkLi0wSlBZtmYwdHLv?=
 =?us-ascii?Q?GmxSkxR452D/j60wch5c5TBkD3cq5Dd5OeoshYuGhq1BuXfMOjwL33mM3u0T?=
 =?us-ascii?Q?v2Tp6Gc2RIfklKL0S8fijN3cXg9+Wk09VWidPWiVAsEcWVK7G6D/l1P0nakQ?=
 =?us-ascii?Q?rAufke5Pi/Hkm7p3g4ZBN760tfLpwvC45Q2NS96128Zkxrzaoab63YNEuirh?=
 =?us-ascii?Q?bA4ne+x5+YfqIB1Dnp3D8TmbYUxgLsJIrabIgyTBzSbFrSLsbMPYGCHM5yYR?=
 =?us-ascii?Q?FV1oGRIvyiLJ7bsp1L6Pm6T6oiUAiSTu1fK3uHW/v/410DAL1mTCqUstvBNk?=
 =?us-ascii?Q?Yw26/iH39/hR0HJVrtALYrKygHWyrBBVCIeP9LJf6v3mlwuS/fHw26IwyJ5l?=
 =?us-ascii?Q?q+BireQ5/te/HLPJ5NajaXtdJXzk+DIvnJXVIXbJP9/NxBZP4tnRUF6IV5i8?=
 =?us-ascii?Q?+5zIIZXZs8GRoMSTEPuFVPwhpcnBWc+uxyMU1Q6/3Jsp+5GnJSkR+MZZ7jey?=
 =?us-ascii?Q?gTn+vpXV7/1a1XBcnQ34q6F9h41UacWa+Q7cidvM4Hpx4uphqhoxeqqBUESx?=
 =?us-ascii?Q?0qSzVzl9kELjM50l6pzXA0R+c6eCynZM67uCXAPSABWUfPwws/dwpnPBzuhl?=
 =?us-ascii?Q?fEVXaMe3xgOeoulZSbr1DtlDjTxGvrpAxbsZDKobcIDl+BS42rQaLIJqhPeP?=
 =?us-ascii?Q?YZ2N4MPtrlJ3cE08gngsr2E5sk/uQy0vPcR9BUs9xp9hgewkvXEGMQEtnFAw?=
 =?us-ascii?Q?hw1StPSroXPHSZgVj9mmK5jSuYz13ff48sg/pyelvRqxPsunpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C4oOpz9x1XCLvxZ9p9BIT0PG4NDLjUINQBaji/6jVVYFZotiwb7jRoKQ/qhj?=
 =?us-ascii?Q?YV7IIqOY7Kh+wW50y4R9qvfU7vq8NwjMjM/okpsWBLOnj5ZzHgN7joGCmGPb?=
 =?us-ascii?Q?il40ZbXWjlKhLsAKJAxsE5ohTJo859cU/K6fUsiO8gccETpNidonfQzTi7QM?=
 =?us-ascii?Q?WZAimFvsGF4YN5KhgM8IWQFdrsJcWLhdHSQIkPD0ePJp9OsPklQaIbjU8uSz?=
 =?us-ascii?Q?2fBZ3wB21+zPwWZKSWWmtgyEROAmqJNUQq5Un+ZHg2fywF4WCadpZLjhJLsr?=
 =?us-ascii?Q?V4bAH4GBP/EPtPqBE2vd0JP+Itwz5AuWDN9Up8zqhbiZpiZjUwL9nVq9TRF2?=
 =?us-ascii?Q?b3MS4BZwAvcFsDDUk6q8WwUFCQsW3bkVYMWkKHvRpzjk7tW9+KsJugOdyXrq?=
 =?us-ascii?Q?K4UQJkkgiBd+PHLi5L6C9Y11DLpfw5zaRcQWhHVwrkUcbLDaWiuPDNQcfGiT?=
 =?us-ascii?Q?5vxt46zj1LAht01OMVniiFh2Uj5J+o3p2egCcQmYg7EZZpJO9SvlrZB+8+hL?=
 =?us-ascii?Q?5TZ46ivVy1xng68gJi763hRjJbq4CTQVy9O4dx6cjkC4SfB1SpHQxkQD5CB6?=
 =?us-ascii?Q?khFmVRerVGfh3etL1UTiaGqYEZCRBPg/gcLsWRKbIvgJInsjQm8/ib/sfeFl?=
 =?us-ascii?Q?szglzi3Ol7S2K/V4NnB1+zeZwLTGi+fOGvMpvZqibZ+Yvaey5FVPBBUpVKcI?=
 =?us-ascii?Q?B4N6zlZNIk4PHdmPawtjHhGjRHVS/bAS5g3Ow3bVO+KdnYLDW6b31yhjXPWS?=
 =?us-ascii?Q?UnedXqB6J6orBi6c10P2yKfxZIY00jbnjXxbWAOeAsJRsrQb8gucE8rR5QBr?=
 =?us-ascii?Q?LQ4rcUog8Dffu+QOZKYiXHFNX5N1bDtA+F+hhWHuwwodmyzcw0gELTsQMBHS?=
 =?us-ascii?Q?P5lxbalbsw//K5xuOitdCBvToh0a7UowFdZFaEbiJ43/QqG6UNl5kh+IwZjf?=
 =?us-ascii?Q?8QPgivaaNvgnFFtDZY8mNxd7X8une+Yw0tIfSqykfLK+Qpq480+HO9mPyHVm?=
 =?us-ascii?Q?jLcjE3llhdk4orQiF8xJG3E9Eqx95Lu7eLvg4+LsTJ72qx9rtiF2YQ7WDvbl?=
 =?us-ascii?Q?zPR2/CjMCM11bQgfi4I4qH3qwr/TRLry3chF/nmh7Yh48R7W/IQAbdyoDY3s?=
 =?us-ascii?Q?7sxtSdDP61H79zD9xYfR7RCDMyAYQFfmUFjYfYXEzKRe4XmefhKZeNJYA9sF?=
 =?us-ascii?Q?Y2K8z6fe6ebTRbHIs4S8gf50qSLXPUHwBomLH4Prhke11EDHy7bISXSLJxli?=
 =?us-ascii?Q?qXwaCp66NxGH68fS8CC5TnbRNoUI0OcYJoT/bzK8soW95l9bjsB47HxMIRkl?=
 =?us-ascii?Q?g2xT3S+r5NV1ct5lewJJo/0I5rOG7lJctpPjgOt50VyxD73ZZRz0YXHBBGDl?=
 =?us-ascii?Q?B937DngWNRKSgHwl/PveI5zpUmi1shGdK/cpBzoAIHfF2fWCAeYvB66W/r9W?=
 =?us-ascii?Q?gItKwz+ps4X0td1NvSZbZK9+T5V03J51mTWc5hHHOvCP8s0T7CXR5A0JalNy?=
 =?us-ascii?Q?8beIHiBL/IL9/bxlLdgzFA3K3xf3dcQgo2/J/rw7QtxnBNoJ8XLcFSJPSgSc?=
 =?us-ascii?Q?HQ4rhuSbkfOKqGmcq5oveFrwaN6Y2Zh/tBEhzhvr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wvQOyVxPoDMo3FaY3VqyjBRUXjCs8r3QowlPJyRJLoRdqt0yrviXrpmhzqR0nTywmTvoARycMgIhTPg50nR+K2IsRXR4vuMGzGmYXYL8jNnsfFTSz31WODf2gz1uWE9eLiqR06GaPSvyHbGjgvJBrhxDHxDL2KwT/TVH7aBZWJODu4qmEdr7A6GCkY1ddqfmXGwhnEpNifC+iZBKqNiXeTdEhu8wdOieCtaqUD60TxoN4BW0tDk0yQ1DnrF0m1qHoVqDuX2gyqc5KTUY1o0IO5eQnwsXqDWlDYOpwpk0tzeV5FmvTUwVCekaW/zxU1A39dZLnY7t8htz9iffImt2N/0UMRiZIjoA9zfJBa8U3VBBhKK6lh1SuTPihT5HBqBgSUpGoZVEzVvyP65vWKqADUUFEYFk8YZ8UOe2U5Q0pVtdiv1kItEIpF/PQe0lfRzLmT9yO3W2zXrTGNWr4LDMjHGcrIn3gL/LxlJw6NysKqy1ouCrJJfFl/gYn4msu7WdZoz+1c36vc3rBwDDDjpf3Z9zFahoW57ad4uj4oBCtHnEFVB1I2Zsusd5xo/KOlqHztUZHcRRXO9PdnHvHRdhjlpRUzeYUBW+efLRy+rocz0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdf0c1b-ef2d-4f70-7fd6-08de36a43281
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:53:18.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b9fmrZ2jzl+Eyb0jcU4RKAaEX8/Qwn7lfA1yqhPVawuWJ/raj3QhBS7l3hXYdYADsp0WBEwIe8M1sBigFD/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4491
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2512080186
X-Authority-Analysis: v=2.4 cv=IOAPywvG c=1 sm=1 tr=0 ts=693748dd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=9AdMxfjQAAAA:20
 a=yPCof4ZbAAAA:8 a=rGfEaqrcWjzacY6KiiMA:9 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4NSBTYWx0ZWRfXx9bOem6b9W8O
 DTnqGHIR3TKJCX+zCiHyMhDxiw+IsBEaypC1krz93kNYm93+mRiSHFFVjQDQiAj2vt4CymAtOgR
 kxbXr0h7hyB2dXzgxJ4PfiAWF/Jggwj11qmoY/OC98KnrGS7qQsqRjQbv9OS9AAwgW9/pSkiKQs
 tFzFwjlcrnWaDO6OKsCQf/Txa24AYnjz3tkBm76Nzf+9Y28sxHeOQmOdXTngHt5+W+/zZHOMxDw
 UZnZO6jmfoft332jHCtOohW9+odqLloV7wAfqQm3lzNvCXrWUohgXNXNo5pwxdjdCxEPg6X1kaN
 8bekQ+V3x8rnVe+Uth/kStvAFya+yRW4KZsUjgjC5Bgy/2ZuTZ3mczoAdIyGInd1fVIT3XtcJOt
 fba3wcnWhEQ9+oGKNG8v0gnbJWr9Yw==
X-Proofpoint-ORIG-GUID: JG3FRhtstQCrdBOw4cpW-lN-sgpglSKH
X-Proofpoint-GUID: JG3FRhtstQCrdBOw4cpW-lN-sgpglSKH

From: Eugene Loh <eugene.loh@oracle.com>

The documentation had been describing the legacy provider, in which sdt
probes were DTrace-specific instrumentation points in the kernel to
support other providers.  In the current implementation, the sdt
provider simply exposes Linux kernel tracepoints.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  3 --
 .../reference/dtrace_providers_rawtp.md       |  8 ++-
 .../reference/dtrace_providers_sdt.md         | 52 ++++++++-----------
 3 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 3e057d4de..7d6b1caec 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -255,9 +255,6 @@
         -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
         -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
     -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
-        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
-            -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
-            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
         -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
     -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
         -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index 67cb0bedc..aa98f9c43 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -1,7 +1,13 @@
 
 # Rawtp Provider <a id="dt_ref_rawtp_prov">
 
-The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
+The `rawtp` provider gives DTrace users access to the tracepoints exposed by the kernel tracing system.
+
+In contrast with the [sdt](../reference/dtrace_providers_sdt.md) provider,
+however, the `rawtp` provider delivers the raw arguments that the kernel
+provides to the tracepoint.
+For more information on kernel tracepoints, see
+<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
 
 To see what raw tracepoints are available on a system, use:
 
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index b4490401a..762972557 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -1,46 +1,36 @@
 
 # SDT Provider <a id="dt_ref_sdt_prov">
 
-The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+The Statically Defined Tracing \(SDT\) provider \(`sdt`\) is for
+tracing markers that have been added manually to the kernel source code.
 
-The SDT mechanism enables programmers to consciously choose locations of interest to users of DTrace and to convey some semantic knowledge about each location through the probe name.
+Historically, DTrace has used SDT instrumentation of the
+kernel source code to provide a number of other providers,
+such as `io`, `lockstat`, `ip`, `tcp`, and `udp`.
 
-Importantly, SDT can act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `lockstat`, `proc`, and `sched`.
+With DTrace on Linux, however, DTrace is a user-space tool,
+avoiding modifications of the kernel source code.
+Therefore, the SDT provider now simply exposes kernel *tracepoints*,
+introduced by various kernel developers at semantically meaningful points of execution,
+making them available as DTrace probes.
 
-Both the name stability and the data stability of the probes are Private, which reflects the kernel's implementation and should not be interpreted as a commitment to preserve these interfaces.
+Probe arguments are converted from raw arguments provided by the kernel
+to a format specified by the tracepoint definition in the kernel source
+code and described in
+`/sys/kernel/debug/tracing/events/`*printk*/*console*/`format`.
 
-**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
-
-## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
-
-If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
-
-DTrace also provides a mechanism for application developers to define user-space static probes.
-
-### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
-
-The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
+To access the raw arguments,
+use the [rawtp](../reference/dtrace_providers_rawtp.md) provider.
 
-The module name and function name of an SDT-based probe correspond to the kernel module name and function name where the probe is declared. DTrace includes the kernel module name and function name as part of the tuple used to identify the probe in the probe description, so you don't need to explicitly include this information when devising the probe name. You can still specify the module and function name when referring to the probe in a DTrace program to prevent namespace collisions. Use the `dtrace -l -m *mymodule*` command to list the probes that *mymodule* has installed and the full names that are seen by DTrace users.
+For more information on kernel tracepoints, see
+<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
 
-The name of the probe depends on the name that's provided in the `DTRACE_PROBE` macro. If the name doesn't contain two consecutive underscores \(`__`\), the name of the probe is as written in the macro. If the name contains two consecutive underscores, the probe name converts the consecutive underscores to a single dash \(`-`\). For example, if a `DTRACE_PROBE` macro specifies `transaction__start`, the SDT probe is named `transaction-start`. This substitution enables C code to provide macro names that aren't valid C identifiers without specifying a string.
-
-SDT can also act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `proc`, and `sched`, which don't have dedicated modules of their own. For example, `kernel/exit.c` contains calls to the `DTRACE_PROC` macro, which are defined as follows in `<linux/sdt.h>`:
-
-```
-# define DTRACE_PROC(name) \
-         DTRACE_PROBE(__proc_##name);
-```
-
-Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
-
-### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
-
-The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
 ## sdt Stability <a id="dt_ref_sdtstab_prov">
 
-The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
+The `sdt` provider uses DTrace's stability mechanism to describe its stabilities.
+These values are listed in the following table.
 
 | Element   | Name Stability | Data Stability | Dependency Class |
 | :---      | :---           | :---           | :---             |
-- 
2.47.3

