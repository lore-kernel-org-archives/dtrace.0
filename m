Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389108;
	b=Az+HxMP/7NXk08akrIoUFmU6cFdX6B1VJJ0uUAp0+KMCo/sxbOueo2r5Eknq3bD889ak
	 n458hIHN2cht6otVlJukomYWaGZdJbXbjaZmxERFBx+B3rERJu1zBu6ldo8XRqpBNm6id
	 a/5sTPlw7WfHjBdag0DM114zVx7W0TyY1JQZpp6EEWnqSRuq2FQga5BSiGmnzhLQ6/B8+
	 DkLFwTcrOAOtL9jhr4c6+vM+w5k9x0cvhqFi23noDhmbcSaf3hpEefypR4ngcWjOPNO1F
	 3kga3EOrNXP+7D0kA+WDkRpGydI6UNSti74/0e+FAjtS+/074wm7XQauY1N6MFe7U5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc;
	bh=IMl7nCMo7tBKHESiu0hnKI8CMkq28l7dlLMafjahX8E=;
	b=YC4THolym6X58n5srIiHpNsFyfVhYaFFwjmGjO3+/NWSy4cJsTD2AI8Yi/TcGxgpoTT7
	 w+NfQNUGxQ/ogC3VsDTHCSBU4aCrSH+biCZoRDhVsnTDNDk3EdIPrOltRvU55ziYZuRUk
	 fzamFD/kW4eLHqgZ3eJlby+8frXaEsRnCf3vWZGVkdiaWIXtN5Xzzolv0uUnlpJA3BDdr
	 Dbf8SMXbGj2oii71LF4FvSlUtQ9clfwX/w/6u9gM7lXefHpGbxTX2+TojsnA2dSuq3sbA
	 rI0bPHdaZH0LgKlgMmAXMc0k+uiyAT375o3DaAb4aBGjOTimRw/Fq/NpZs8c5Kxx1ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=eZdmuP3+;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OybTztkB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108DE606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=eZdmuP3+;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OybTztkB
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYRf61603765
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=IMl7nCMo7tBKHESiu0hnKI8CMkq28l7dlLMafjahX8E=; b=
	eZdmuP3+4dOaKpsqNt4keCeZydHcjNLZJb7+DBxayIJgCUAYpPaafJIxKpe39MIq
	wqOM5mDQrqNIeWn/uiEF8H6dZVae5idvRLgWJ5X+DhXjRiT9YO8MyCrD1gN2UIB2
	Qq3IvxwqHcv5cvT9F0CQYep0Bwx/Iban5dBBCEiOVWdkFCZtQi1tZApC27JdkWQD
	C1Qugc3inpxdlCkf+GEJuBXFVh0OxkbIw/alIvbktvaBkGsj6c0dpBhrmJLe76OW
	2a28Kmf0+GI1XeEn0Ds4fTRC/WyYQndmtIeajAZOzT08cOzYVL681Xun+cPtFvWQ
	xsuYShpI8fkHzZTBy8G4zw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5qhdqj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJLk6R3892202
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:25 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn1b28e1j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YL7eLr5iE2B8BhY1DEaB81uoOSvHwRUdOdn66eHokzGT0rvNhA5lNl4ZWuP/9/vRKy7bb6ez2+D8r5Err2HC4gqBh3oYCYqRHGjslPBURPH5ZA0/4HNIFXxlR1wZjhziy1sylf8IScKp1pZ0CKm+pMotHSkf1NllJEoB2Mldm5eKZrSd4Jd/g0JatyeyLz2AHVoEOQtALe007rCa2e9nEmS7kIw+xZuWMZG6g/GWtGQ7bXK3YYve3rm5Abxose/RwscDzFDv00IcrX/5ZCcRXvsunZOVM/dXEvwNAj4TJfRPgXBph/h/KuBJnBzxEgzi7x3f+qS/lx021fIGjK7YEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMl7nCMo7tBKHESiu0hnKI8CMkq28l7dlLMafjahX8E=;
 b=i1eSKBtUraCmU4BxtsIeKAq+OnNl2lPDQY49DGy9WwBORAgxx2p5aeAGMhSYzJiXMGppImtLVvuKGRoA8xAqOhO5+Fa2OcU961gQGa6CFuy2KmAVhy28qxRtCAqdruAXZISNqqIyuTHNfMKTbXSyhplFKvc0PvSZ0YOROnP1nH1m9h0wW9ACIipQTG7xcah/+Z06OlDlHevaOVJ96tcxKdQwXLK1ZPhyL0BWKHbgSXG4BSBZ3cQKyDfaV+HXSifNOGb5ngkPOiQnJ+oXTT22JtWOM48o1AMoWiP8MBP8zvSehbNCTcze1LAF/LqyxzojqVaBQlV8UVOmojyt1H/T7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMl7nCMo7tBKHESiu0hnKI8CMkq28l7dlLMafjahX8E=;
 b=OybTztkBLFg7PfQgszA+9kyvOyFaHprR/AmTah+W1NKTzKIo89TdnHTvPKeljzcfV1+btPB7MKhetc6dIL+cLusxFNwuJNQP4BDKwaR+ibQka4dIMio0PRVrMIHZpqpvcff7wW/1RRZm0Hc+mIEC43uJy5mvMKaaC8spnmef+sw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB5010.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:22 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:22 +0000
Date: Fri, 30 Oct 2026 19:36:47 +0000
Message-ID: <24b4b0f9f1f1b21146f37d5f08386734@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/20] libdtrace: cache missing kernel CTF archives until
 paths change
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB5010:EE_
X-MS-PublicTrafficType: Email
client-request-id: 620b2c53-ea2d-48a0-b012-fda97447b82e
request-id: 3a428793-67c2-423a-11e8-08df36bd5b8f
X-MS-Office365-Filtering-Correlation-Id: 3a428793-67c2-423a-11e8-08df36bd5b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|261009223027099003|261026140227099003|261026130827099003|261028144727099003|261021130227099003|261021121427099003|261021135927099003|261021123027099003|261022075727099003|261022113327099003|261022115727099003|261022105027099003|261026121527099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wFLEGjwFvr0OJCFNL2vxeHU6Lt7M41wyWFDN41auFUh68sz2Wb0Quz/JEk2kpaDTsfs+D6Xr3jsvnWqhrON0mcbFp8dKew2mTBuJ7Jaoc6x3BCTqsafz9+zkXKMwBUXNjT7V3T15knqQdZSDlV8Uqbgtz90qYriwzJ8Nn4U04XsA1y/LDLlu62KmIozlpB22QZCt4HxP7QgI9UorIlBAaUs3qoT1bTUGdB7+O+ZbGQYb1sH04o78iNYc7Lo0lHGSSaOp7ERZ5Y3kgeL1waQBoS7XCNPraJw7rb6/tIhewQ0cUyYGoh2A05y2pn7tzrEhbFlCXVVKp1IWo84pqYEU6CkySWQHAmjeNOE6i3L9oed2nFYbQZ8f7JtAnTqllo6z3qcUtI/VOiHACQ5PX+arq/3DSi/gDTTKufZbUZZkzG6bM7uAvKiwdTmRHnu5UAtkVB+lf3JG1nO3bj7ZxeyS8rfvF65m0ijq6QktsTHPm8dHuhfApxHsmaPOhcN4f9OopHRZkTYEuFXVj0dD/KYfO+cKOVK2FyW7wprDKvaZ98O7+Y/HF718IwRu2mnbrujpFvSgSxji0gYHoUzcqqRk8olALbLFrziNTbHhUpBvHUuOcOeNdbBcDWvaHelxzheXfeYvmmgykk39gr6g4EVVbLTsMP9x+RHkPYTerCZmOyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(261009223027099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021130227099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261022105027099003)(261026121527099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IX1zxeP3gNIoQH0KgZhNR39JIDRtSvwzzlvOW+94zTQyCgqJ9MM7rvnu955I?=
 =?us-ascii?Q?Zmq8xp/AN9wIrtQTYADBOtbgFT6E0up49e6UOoYAwbn/C2WJKzxlquKzINu9?=
 =?us-ascii?Q?AyhvatOhnpsv3CnQ5eG+Jc1vGOmOz200vQpM8d+111AEfRnitDwsPZCXpHaG?=
 =?us-ascii?Q?20bCiEa+WO43liunAzADSGA7MfpMkaWivViFz2bfmgjgrmTZ7huMJ/wUaalu?=
 =?us-ascii?Q?AiprA+uK5Rycgh7eUFh1OPKqUPztWohoATWKhOjsR57pYhAdKcLApZmEvqE6?=
 =?us-ascii?Q?93XlV1SVtr5qL89jx6Md4iXglAuFXxmegfqrLQHkWngx/t1nUojM5IAdjTMf?=
 =?us-ascii?Q?YXMyT5YnXbo4bMq/1DSBodm2KRAg+1wW9DWEVbNZPE9o4Bx4sAHQJHZRUF8g?=
 =?us-ascii?Q?zr2E5fzsv20TcmN9JmHfmjksrxfzNJskI4d9xW2KxhHztIL466SRtikHKqdM?=
 =?us-ascii?Q?V3FO/86u2g+KpziQEN3uxn06SkjRZ76JSCvr9Xskl7mXcxClCxkRJ3en4LoL?=
 =?us-ascii?Q?1T1NfYThN08VMjlCZbaesbhsLXQErWHX/CSUlvqitS3qvfjSRGFw1OikX4do?=
 =?us-ascii?Q?P3+f+9KeJ8QWA4xGWu5rl2Ph4kmy5FUgH/6gH29lnoG/wP+mL9TFMjEzuQ5n?=
 =?us-ascii?Q?WE79+5yhdmu8u3A/Wv6KzgMYfAapwA0AydqLfAf3gyUgm/AmyKaATPlg2Em4?=
 =?us-ascii?Q?w7Z+WzO08CWfdYMEsWH7F99KuubF9bMhgWIoEJGHblVUApNNgKaJwHDx7J7Q?=
 =?us-ascii?Q?xm02iHw+NF4XEWqWeS13Xq6voDVenh57AIaBieZWvC0HqvWH2g0QcFrutAUc?=
 =?us-ascii?Q?0QHWVxLslYbdrMwhedt5qlXg3na89rzaVMTIw7FmnwB84IDgDTkbfxXH2mwk?=
 =?us-ascii?Q?/i3CLNPK+NFB/c2n8o7lIrq2XFRhZoC37wBG3D1KGi2SIluvgdgoLy85v9Aw?=
 =?us-ascii?Q?h+n72nX4drEeRMjYP7zAysjJ/XkkHJqu0qL1NPcaqqNcaIBbYDdsWHMk0ANU?=
 =?us-ascii?Q?t4eWcSPlDhzOBJrLCr1rALatxypwXP+BFGmbjnzBHmCGNjyB1P5EHhRcaNVn?=
 =?us-ascii?Q?7hsFFysri630IKWF/VcozdskPgILDikep203paTJkOqKBUEmvesvx6poGG25?=
 =?us-ascii?Q?8XnzDWwdVATz5aX/GqtFDFemFeIinV7+fqowX9qfiCKdTtIK7V9LDenHp6XL?=
 =?us-ascii?Q?kIhV8Q/LZpvuVrYkIuTlV6tqCQjd4m3fQ197dtzyCKtgl9zBhEwTPgmvE77u?=
 =?us-ascii?Q?9cd0TsIANQQI/3NpUCuBxic2Dvk2dWrSNnWYY0sOS6fYklYrGAmQlHVFrED9?=
 =?us-ascii?Q?an1NqHdruF5I+6D5gdhzCA9A7CKp18DkljQKyLrSsFTgpiQBpU6zG+PjTgNr?=
 =?us-ascii?Q?Q3iJvt/tS6AiMMlmE9AGG+7x122QBeFXcHxcwZ6eP1n7L9eoTUv766Omrwkx?=
 =?us-ascii?Q?Havb9dVkeun+PjATOZp7AqAvcBNDMBg86zVSf+1jnLm4s90CqWS3gdw1Zi11?=
 =?us-ascii?Q?ma//PUe4AbfSgjfkUXLGkfHo+ETwhgbknnZkfumM1lIlsbVyUMuNkVT7CpEC?=
 =?us-ascii?Q?hT7nHRSTpw0kPyJsGAvAhBpntTadPGTcwjR9TXzvH5T5trwtYhlzOXTTJM9h?=
 =?us-ascii?Q?o3OPuLE2RKMoQqy4eM/odZBp/TFPf4cP7VwfDgxqK8T/eQtxNctv/OA/8ie2?=
 =?us-ascii?Q?/ut04jfwpLo/aBLIH7t1TiFHzAZ/5RviXGXbXxJcRWnUalS6YQvI7nqDpJ+P?=
 =?us-ascii?Q?3NimwBdTUcuPDBSXMS/ii/i2j+XN600=3D?=
X-Exchange-RoutingPolicyChecked:
	5V3QEZs/SYMzh7wS4BzbjEODY/s3/L/oFSPAZvNBlQ/G6MkG2iFMki9r0OiDqhIQ/xuz/Srv/Y1ZiD7QRZ0JHi8O9SxGeHfTnWvIIvAOG6SR018g4ra3woZs3b0Q0XaK/7DYhQStikHUdqBtUTjq+/5KrtlSSOubCEpRaz1YatGDeJdIHNQGvSmJxkFlzk0S2gqLQoZMKXROwWq/QqJ0XLhwQnhSJnLIueAqdIUuLSgedhMmEIo5+cztWkUkotEwAjduA/VmoAw/SMk91WKZ1JgSMa8b3BKgqTNUMqb1UygJiZq15S7SiR9ydSgdFthRURcRZ6Huqw5rq+w8Zor2Og==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XY3pfmKVZu9tISvVhn5mt5hTfRqNQVjuZJCwy4GEg4nn5XS76sOlmPaPkip8v39Dc7ursSUxHy6V88WPR6PhLRdzbNbbMcKXB2NMX4fIxyCYMbcOmZRtoVpSfmNQBHmDZihNJQhyyI7amxsnuijpgpuFaWQa948K6qoWHjMcPID1Pi0tacStWT+So+X6th18FKxDSyR8ljKXe7sAA2LY6R8MvGqXmpHbEg8QF/zFgUNIXGH5soI6XM35ss2ObfDm9ehRjSv4GFK51HM40fGyh8Drim2jZHJqNKPpQ3pSeNKu3IyiAxcGW9/vW/Exq9guLIONTODMK9D358h3Tqp2Z4SAOWLU2ZKpiASoXt6hF1jvo5UvlOHy46uMoJUKy2Lo2D9DSxnJoWYMFq6X9Wz3SU8/y7YOdi7newy5cW1W9V/ikECz/xz8x8AblUQKUo/ioiJ/FwgHmF6SZJj6Za107To0reGCng6q17HjyRTvT1uJb0OLbz0bptnJ4EnmqGvEz8PWrDLOJ5R8qQ4VExYNL/IQ/jltZmaBMlo2UcXfRmmAr67I8AEkZQ+huoVHd81DAyjTlcsFPfjfRTF63QaZb11t+bFh9gPRCO1M6g3UdMo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a428793-67c2-423a-11e8-08df36bd5b8f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:22.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eft8A+J54A6ZtMLgJqhjyUdsC4YPMOtW9b5Q0dZZLfJW9ytBBNHJWIEHnmdk5Nh3di9FLgnfHLiwDdumZ0D3tM1lfub13Glgvc9hE+4yjwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=OrbaWC/t c=1 sm=1 tr=0 ts=6ae4f231 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=5nMcHe6MPVj0L8prqJUA:9
X-Proofpoint-GUID: aNa7CXD_0-LaT4ytTXj2jbD4Kzl2DY3G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX9LPWl+GMcnCu
 CD8wtXMjaPP2fhWZZM2H0wlgdLOYSshTnvtYMV0eqJp1WjeU+ZAVNqp/wprL+i1zi0Os74OsiXF
 bCnBKhX6+ZG5h11mmESNlTdOkHea90CEOjQXV/eCQiHppXgbtrQ/
X-Proofpoint-ORIG-GUID: aNa7CXD_0-LaT4ytTXj2jbD4Kzl2DY3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+SV0mXzsATy5
 Cjv5k56jAG0MASnFw6gRsti6lLxl9X9h/awPFyqPEj9GPPS+j3m699uFe4i5YAcZLdJAyQGqiw1
 suI/DaNtxPxOUT174LUGFj2jvLSAFLy4GMWsBjtqZJFXoH5LxNqEMWIgoub/J0DUkYjcUxRaH4F
 SEAIJ1yYRxdkK9H3XglG7wEWHooHl/YJyE0d5qlkxmq7jIJpc0WfP/8aLjDI1cxOe1iwYC6VlGB
 gRhoG01C61fSKDgOFNWVsVApjTSHJPDYgDZkzakDbbFWt1N+aXKCcuoHwHui7YnUixX4snfYnBi
 3xPA9bZW4fIUyqn3GSHQY6eS0Q6h++iaT45hVWlhtdrTBisoIROTNu0he8mCoajdeuGj03R7ptx
 VKhIi7XKp21X/wc6rMaESI20SqrkjXb9gU4FB2EhkxCPb0WQ8flgNMXFNO5f+2fVww+tv18ph7J
 +Gl4Dw2UsAFsWaqiRgg==

---
 libdtrace/dt_impl.h        |  1 +
 libdtrace/dt_module.c      | 16 +++++++++++--
 libdtrace/dt_options.c     |  3 +++
 test/triggers/Build        |  1 +
 test/triggers/shared-ctf.c | 49 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 972fceaf..5487bfcf 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -310,6 +310,7 @@ struct dtrace_hdl {
 	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
 	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
 	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
+	int dt_ctfa_missing;	/* cached ENOENT/ENOTDIR for the archive */
 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
 	void *dt_ctfa_data;	/* backing data for dt_ctfa */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index ad43e815..f381bdcd 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1329,16 +1329,28 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		if (dtp->dt_ctfa_path == NULL) {
 			ctfa_name = malloc(strlen(dtp->dt_module_path) +
 			    strlen("/kernel/vmlinux.ctfa") + 1);
+			if (ctfa_name == NULL) {
+				dt_set_errno(dtp, EDT_NOMEM);
+				return;
+			}
 			to = stpcpy(ctfa_name, dtp->dt_module_path);
 			stpcpy(to, "/kernel/vmlinux.ctfa");
 		} else
 			ctfa_name = dtp->dt_ctfa_path;
 
+		/* Cache absence, but retry allocation, permission, and I/O errors. */
+		if (dtp->dt_ctfa_missing)
+			dtp->dt_ctferr = dtp->dt_ctfa_missing;
+		else {
 #ifdef HAVE_LIBCTF
-		dtp->dt_ctfa = dt_ctfa_open(dtp, ctfa_name);
+			dtp->dt_ctfa = dt_ctfa_open(dtp, ctfa_name);
 #else
-		dtp->dt_ctfa = ctf_arc_open(ctfa_name, &dtp->dt_ctferr);
+			dtp->dt_ctfa = ctf_arc_open(ctfa_name, &dtp->dt_ctferr);
 #endif
+			if (dtp->dt_ctfa == NULL &&
+			    (dtp->dt_ctferr == ENOENT || dtp->dt_ctferr == ENOTDIR))
+				dtp->dt_ctfa_missing = dtp->dt_ctferr;
+		}
 		if (dtp->dt_ctfa != NULL) {
 			/*
 			 * Load in the shared CTF immediately.
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 78ff23e5..2b75d3c0 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -320,6 +320,7 @@ dt_opt_btf_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 
 	free(dtp->dt_btf_path);
 	dtp->dt_btf_path = btf;
+	dtp->dt_ctfa_missing = 0;
 
 	return 0;
 }
@@ -340,6 +341,7 @@ dt_opt_ctfa_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 
 	free(dtp->dt_ctfa_path);
 	dtp->dt_ctfa_path = ctfa;
+	dtp->dt_ctfa_missing = 0;
 
 	return 0;
 }
@@ -425,6 +427,7 @@ dt_opt_module_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 
 	free(dtp->dt_module_path);
 	dtp->dt_module_path = proc;
+	dtp->dt_ctfa_missing = 0;
 
 	return 0;
 }
diff --git a/test/triggers/Build b/test/triggers/Build
index 607ea00b..8d648bab 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -267,6 +267,7 @@ module-discovery_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
     $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
 
 # Exercise shared dictionary ownership using libdtrace's private module APIs.
+shared-ctf_LDFLAGS := -Wl,--wrap=open64
 shared-ctf_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
 shared-ctf_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
 shared-ctf_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
diff --git a/test/triggers/shared-ctf.c b/test/triggers/shared-ctf.c
index 79aeeda5..74c55c44 100644
--- a/test/triggers/shared-ctf.c
+++ b/test/triggers/shared-ctf.c
@@ -4,6 +4,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+#include <errno.h>
+#include <stdarg.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -12,6 +14,34 @@
 #include <dt_module.h>
 #include <dt_kernel_module.h>
 
+static const char *watched_archive;
+static int archive_opens, archive_io_error;
+
+extern int __real_open64(const char *, int, ...);
+
+int
+__wrap_open64(const char *path, int flags, ...)
+{
+	mode_t mode = 0;
+
+	if (flags & O_CREAT) {
+		va_list ap;
+
+		va_start(ap, flags);
+		mode = va_arg(ap, int);
+		va_end(ap);
+	}
+	if (watched_archive && strcmp(path, watched_archive) == 0) {
+		archive_opens++;
+		if (archive_io_error) {
+			archive_io_error = 0;
+			errno = EIO;
+			return -1;
+		}
+	}
+	return __real_open64(path, flags, mode);
+}
+
 #ifdef HAVE_LIBCTF
 #define CHECK(expr) do { \
 	if (!(expr)) { \
@@ -227,7 +257,26 @@ check_embedded(const char *missing, const char *embedded)
 	dtp->dt_kernpaths = NULL;
 	CHECK(dt_kern_path_create(dtp, strdup("shared_ctf_test"), strdup(missing)) != NULL);
 	CHECK((shared = dt_module_create(dtp, "shared_ctf")) != NULL);
+	/* Transient errors retry; confirmed absence is cached until a path changes. */
+	watched_archive = missing;
+	archive_opens = 0;
+	archive_io_error = 1;
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 1);
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 2);
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 2);
+	CHECK(dtrace_setopt(dtp, "ctfpath", missing) == 0);
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 3);
+	CHECK(dtrace_setopt(dtp, "btfpath", "none") == 0);
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 4);
+	CHECK(dtrace_setopt(dtp, "modpath", dtp->dt_module_path) == 0);
 	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(archive_opens == 5);
+	watched_archive = NULL;
 	CHECK(dtrace_errno(dtp) == EDT_NOCTF);
 	CHECK(dt_module_shared_ctf(dtp) == NULL);
 
-- 
2.52.0

