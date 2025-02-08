Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13370241129
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041618; cv=fail; b=VVG5sEbjeGTs9DEZivgpVDEhMQLYHVx2D2KEAHUbW2sjCWZ6By2ol61vCwyT4rqgUGI7+CpJgR6zvgVhTFARhEk5yCn7AdriKPWwPN4sRiJJaXr1Roe18vt0C2OJKp4yVB8gEHlOPblQbPQGSb6L7P1IwboEpgeVrGF1+5shfPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041618; c=relaxed/simple;
	bh=ogN7h5WIV1vGvH7hWW9O8RCFkYf9NMZZGYT01fKiEFc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jf8PigyaE9ATu5q3zuS3S8yPSq0PHVWEgJupEna4AcG4vSA8iIxqRSEThutrBPOI9EfUxIZsKa2u1Fs+kHS6qcl5p8oP6HAywVG2CZIiqXn/Halt8h6vNt3Y6x5KID93WQCt5TSWg10CLKTTdQ+hdNQ36NT9W/6wgjHuWikzXdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U1lyNi8V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q09NqPu5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U1lyNi8V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q09NqPu5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518IVbah017832
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=OqTOy/W2dBR/GQ7cAS
	+OrTxlGTAhRBGdf0va+Gm5IAw=; b=U1lyNi8VdUPpAPeLMwN+o6qSmakOhETpXv
	emcgL+tLGTi7qQjq7a3uY/y6HKrKRxtg6DTAqQOjrOZaGcoO2pQxPwdFzQd/DuHa
	YAyxCDN7n0A3zG+xqtQ30HjrlBGaGOHKMJgPYXwALB3iS2eO6x+Ecvg1mrkaoAnj
	7CZU1JDWsuTUxW+4R83qUG+cuBhERCNHZPJP31oyZWO/joW5SN3+TWvTI3uZuVE/
	AMT759hGw9YfVqF/+VbSO2k8auzZQEWVU2pJq89wFBXzijJ/kz2UMClGnkoQsFt1
	rm5bPJUoLGg+6GXa17xz1je7CUjSiH2A2ab0xfNR+T5Q2LzF55vA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tg0er7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:06:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518EjQvk018641
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:06:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqc82ut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFiEcqSZwYTs/2N0gd+iu+KtIL9Ypdt/6Nsz0dzbL/2Q518h1B8bm6OWPMy2BffxkCPAikIKhKX+hds0lMEGeQuVv3GV8DyE1pGU2Zwwjqcf0G5Pd+cpl/mzRmteVKbYfkTBT/4gTD65EBQ+Xom7e2+lBYA1EBBRyjVyXgcrOmFb9eel9sDsoSl0pninF9hWunrCAO67Eijli4s8nidHqHzDdw0pwlTsJ3k4zX4XPRiWYO0Nl/oChkdgwCiXmeQRUVrX2JrTAa4E7YWGBwsLKpVAxKTe5HIU8TwOzvbDjhDPTJhx9J5snAIWLEy0dA3ZOEAYh3d3O6beoVcjoyEXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqTOy/W2dBR/GQ7cAS+OrTxlGTAhRBGdf0va+Gm5IAw=;
 b=NulK2PZdQ7XBQpbo9baJApTxYqlbDuAARTlxayR+An1v6A2kr5s7U9sHcSpCWUQ7ip9YCWdBrPiF6AWRtpbvp6Y6Ak9h6hmIV/6OvYnuDzrx8k3O/bTOB1r/JFfj6WTunhulpkFZ1F+7BH5HtJL6D1AYifFZo3PBpy7EtKdY6H8ujC2Fh4ZFkJp5NEtQTpAtVZoR8DqLCnYZEC91uNJ/GEpLItcfv22CdAX50s1v38UG/qqSIDVzrf9891ySclthE9qpwjmjhsdu5++EAEfne9cr/XZkQdjM8jJmRPbb8KQzH6UWRfymAEyYvjuFC1e0F+q5Y96ypnj9iQRncjELcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqTOy/W2dBR/GQ7cAS+OrTxlGTAhRBGdf0va+Gm5IAw=;
 b=Q09NqPu5tARaaz2NMRF0stTpBBP+CUnviCSi3sGIYFRAtRLphBYscLg3ifqiPIly9bZy1zuGv7jwWRf+RaQoiAP709WmQwwA0pCEMFjJnwA3/p+r23uhAtPl1WG/HlWL3Cf8+7eUOebmE+fZ2m2AZOuhu449hBIhIzeuv/+zuQE=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB6147.namprd10.prod.outlook.com (2603:10b6:208:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Sat, 8 Feb
 2025 19:06:52 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 19:06:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] Eliminate DT_VERS_LATEST
Date: Sat,  8 Feb 2025 14:06:20 -0500
Message-Id: <20250208190622.23484-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250208190622.23484-1-eugene.loh@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc22d17-89a7-465b-5ffb-08dd4873bef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIIROnpteIvk4umCdBcv7QpqiuUUgJhr9VjdBWhs5BY7dsVJpIr5grbGIYcb?=
 =?us-ascii?Q?IaEgT3kzNILeZv7YhUVvnAHhPnJtu5Z7MlRMQAmaN5tZe5v7o0cL9h6vKcdD?=
 =?us-ascii?Q?7D6hk9buE+AwFymYtUXZhCSHfLNN+U7FQK2fIt6s1EdF6R7fD97UO7IUMp2U?=
 =?us-ascii?Q?eIJcLHcphe51uM64tPC4kc9xJE/gYInoaNNN6CY/p57pwX4WyRc7x2GXwCWJ?=
 =?us-ascii?Q?Td8+WOjT14OV14afm/qJRWw4RqxFwvd4U0H+U8p+01f0WyurxfsMNag4Hy1O?=
 =?us-ascii?Q?WT5MXxmH2crr1hnfKMLJQka/KykbJ6R/+3dvBZBKyxZ3Rc4inYfyhMJj1kMe?=
 =?us-ascii?Q?xjQQpqZMWBV8Hldj6ZSdyKFdPJ5vQEWg/NKoeG72sDSV+Cl7q1plEVQiDgqb?=
 =?us-ascii?Q?XsNRqieRrGYkiCWNGY6xIb+0n3QPnT2GX1q85n/WbSoAXf9IW28AzSwDhz/3?=
 =?us-ascii?Q?n9GBlvfRkpYX6e08LpFRaPf1cgR2mzDn63Yr0unLUpQqfcaW+79j2g0McSLP?=
 =?us-ascii?Q?yPzHuqMwAHIzcrdDSYy1ozlEttJEIhjpVKiZe51wfOQ3D27CSRXZ0BX2SlP3?=
 =?us-ascii?Q?HK+Expxa1bFo8TOw6m1alTzzxmWwwH30n5yjEKjOmZEy16e3dfiPzOszHuO7?=
 =?us-ascii?Q?svAt9nvYq5UIXbeS7IfLq8UmYeVDZX7wt2cPUubgoYpTI5tWLYoi6iHmfZUD?=
 =?us-ascii?Q?/0Fx8kRCimMaemXVprCydnBGncG7YbY72d/TbKBOW97QRNqcnMuwrAiqEffu?=
 =?us-ascii?Q?AR2JDjpmHWppc5umxeir0v+hjTGlcUZwpGUw5Kov2MDz4a4JeVjCMJAUUxLS?=
 =?us-ascii?Q?/3lsAPf1oQxKl0aIaomKWJYzn+61cOU5T6HWzyKLG//q82XTn2SZJSp4+OuZ?=
 =?us-ascii?Q?MgWDYTzslKNfsDgM3VeA84GpOZBZkz5Bgfx029uf8SsvV5RNbSqsAES4uood?=
 =?us-ascii?Q?vi5aYajEKyeX2zYerlZbYxu6K3Z/zddObI1y48IVyrtmO1XlfuHIouLBpNGd?=
 =?us-ascii?Q?SRv3BjjXL+aM+qWB4tqhVVl2eboGuCT/ul9dhNcnOCTCe2O0fEO40Vv8SHP9?=
 =?us-ascii?Q?Td3VM7NohNSeEFKkYaMO240IyhmD6OgRkc5YGKGhSaKI3wAtRcw2b25R5YzN?=
 =?us-ascii?Q?QIznwwYgdWTAGDSkFr0HDtB4La9qW6DXiEiNPy23lzqJNNEcdsbFryCbNeLL?=
 =?us-ascii?Q?wKJqLL8GCT27ogvgZG0DdWj5+oyajZOrsJgpaDMXQc2ALn8MO4wuGVfyeJKL?=
 =?us-ascii?Q?CYa5z8z42qh5+cKXcPM8V0mx1fQFImG/j0XwPJvh5nGdXKiDQq/OpvSitAMe?=
 =?us-ascii?Q?g825fsFHp7QnNhpJRHjqd0s0BiicEBcDl6wrVqNiKMA03GxeiBCP6Jxhhjju?=
 =?us-ascii?Q?roOJ8j4BvF+BtTkSOGcOByhyg/jO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6kTHV+in3zU6MEUV7hYpIKZ7tXuqZBDTMpV4ppjgiofZuNBfKHhjB8ty9xXO?=
 =?us-ascii?Q?LJaJuz/s5LoK62SaBSe5hzEnemctRmwRP1fTEzm2xtVupbAa0N9r7/k3YCkM?=
 =?us-ascii?Q?a/WEX+yvO6owJ3QlAd6MnLtcV2dTq0aZIawYn3WZ+xOLqoXmHIQeEkAFmxUA?=
 =?us-ascii?Q?/s7PLPrXJzLNU004ACptulIorDh3jdnszojRtvFCXrr/9ZGkN7SDadfnaBhV?=
 =?us-ascii?Q?dpZAsiBUOnwNPMm3dyQibxA18f/3qaZObwfBy/nu3eYbbxx90VJ3ClJE2gLe?=
 =?us-ascii?Q?lEEh1LtwKfPus+ClljCdb64tAOEYCDugWIJmLJNmB+E8CaJye/n2f+1gLVJm?=
 =?us-ascii?Q?q6Zj7M1Aidd3KyQN4wSgY6A1UXvtg8gwlnS1+0wtLee1ywsP89ixf0pTP5CG?=
 =?us-ascii?Q?MNYTDmPqWi5SejJVxl9/DoOnz7lcqZ32rV5n35PSnWNJKzuwnoFzCdDsf/ep?=
 =?us-ascii?Q?sAEKOcwO29Um5HieExgizCMxLjX37YneFIFI01XyrIYrlfnzYK/N1CPxwRKM?=
 =?us-ascii?Q?pAmXc7L9P260n+9+0eVGh9SsfgQTdvV/V84VwunzNQuO1p0dxZ/B1waUICXa?=
 =?us-ascii?Q?jrCH3XlTeKJhxrqsYnQpS4xv88X47GuONsqMj2o0UyaGc6cEt7EXdQ6YXdXi?=
 =?us-ascii?Q?NqX48Oo4tyBye7TYhGkQfD+jKDVgK4oUQJwhScw7aa4MNn5apoOZLyrSTdWP?=
 =?us-ascii?Q?IAwjexn+0hB8oPo6g296yO1mMN6rXQE7nL4mSy5/tj0Gsd801tQHyTav+S2X?=
 =?us-ascii?Q?qtACWJAyUwb0VCmtFT3047J7ytKC8AXDdp+EeXpZjRAshV7hf4ZFvdnquPz5?=
 =?us-ascii?Q?hUmaMLxtyAX+gbjk9iLpcRoxl03YbzAYW8bEOtVrWY5DWz2xCh7Smuvv+XTr?=
 =?us-ascii?Q?IIisJ0pp+TG/PDvmjv+hrlCtSj6GAvksaZchIqyx/UTaTd06d4bevfriPrnH?=
 =?us-ascii?Q?o10ZbFrNageg0xLCUR0THhqQGQw0oNgYDbFgxSABJ/VKyt33mml/IHie5AQd?=
 =?us-ascii?Q?XTh0cz2zvRaVMGM3WO+AHDkEgG00z+eiHqYylqtXb6kWCE+nAdeyBmqzGk2e?=
 =?us-ascii?Q?/ZGclBx5mt3fPr3v56AAG7B2t+G+8NyqmvuL0JktKLZ9c5rxnZEoWpB9aHsf?=
 =?us-ascii?Q?rfgLLG4deWei82Fe1OV5DpMkqCjAVS9CMuHHHnbjeRDVerw4rfSiaZLPd31t?=
 =?us-ascii?Q?/BcODOS7FxQrH+5aHAM4wJ2tdhUsmt770CKq9C2GPdpmOC3ncC+K9Wc8Kw33?=
 =?us-ascii?Q?MPYhj4p38qQgug0buPe8brxCy4RTqCFeAgBSUL/rw3YvGlh5ya9P6m2rWkBy?=
 =?us-ascii?Q?IDjzJu/c8iTc+gYrjFncNdBhBcUZ0gfnXruSXv7erhXbEfdffcylzIgSLk5Q?=
 =?us-ascii?Q?aRreC+aag7F9CZPdIPqiJK2IlXoCj7QOT7ThFYqNTnMg3eCrGGaYsRdjdHY+?=
 =?us-ascii?Q?UIC8tCb/a8xA3CGhNtevQq+Pp8SpMcUAwK+OvW74ixqi21HloPWcqur4d5hh?=
 =?us-ascii?Q?HRLxXvDyKTy+Y0sT2lwsfEbVYn9bjwuS7xR73lH0dk5NIdrbKPI3u6Rfpzco?=
 =?us-ascii?Q?+uCGeak1owk+xikUgW7UcqfF/b7ST8WiieTDUdqx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7F/jvQhial5fm5XQQ7GMWAWdbcmtlA/RZZlkETkry+F+otplbYV4Eedt/IOsab67Q4xcEVTwGh6IB3aNWb303EFS3oQhr+agicoBe+tIOYKB4u/dMeNw8p+ggIQfDDWypl4SLzAzdGYx1wjaRMwleSlAMhL9Zel6BbEl5SYWcxL2qbFI2Wf9iSW39Q+RcS6RFWjD/dsumNONy6rmxtENyN8ni6WTRoH9gt76BAH3jWs4gNUMcfwRJD+Wtuj6CF4UJ7FuQbH2yi5VGb5+bJeKVxYPP1ld6nH77gjajrt83GI1h5I7kpG7kh+860F5iCZqdbgxWc2V/TYGu0MXHlGQoQOtkdpZs3HlzbQtvitb0X6PL+CMF90rO6TzliQXEq4jD2pBFv8AA+bl0TRSDEmmc8kyKEzdZ1RfZQBH9iWqMi6uoGv7YLuEGkWvxptNMdf2xiQvCiQqBI4XCPOOFH7CVlBEFdCI5bSZyfT7okTEgiRnVntELe096N21F20jwrOQuj7n8UHw4iMi36ES3sZDL330IEPq2+Bq/mFQUketGebZrzS52iri/Jh/ghLlIqZvaTjrnlsEkbYSg9tXb11oRn2hTKjj9WbNIMhgpV4Ng4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc22d17-89a7-465b-5ffb-08dd4873bef1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 19:06:51.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjtE22LbfpOjqFyeShGaKpRp7GNPOKD24pdPVAXG6FigWNAFFjmke2ZOojE04NoDDZZTc5t+jbWcELQri1PwHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080162
X-Proofpoint-GUID: eibDHPL2WQQLWBIUpA8kcaZV6iwSPLti
X-Proofpoint-ORIG-GUID: eibDHPL2WQQLWBIUpA8kcaZV6iwSPLti

From: Eugene Loh <eugene.loh@oracle.com>

Updating the DTrace version number requires too many distinct
changes.  Eliminate DT_VERS_LATEST, since it can be determined
on the fly.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_open.c    |  3 ++-
 libdtrace/dt_version.h | 14 +++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a02058871..b4d160359 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -721,7 +721,8 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
 	if (dt_aggregate_init(dtp) == -1)
 		return set_open_errno(dtp, errp, dtrace_errno(dtp));
-	dtp->dt_vmax = DT_VERS_LATEST;
+	for (i = 0; _dtrace_versions[i] != 0; i++)
+		dtp->dt_vmax = _dtrace_versions[i];
 	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
 	dtp->dt_cpp_argv = malloc(sizeof(char *));
 	dtp->dt_cpp_argc = 1;
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 3fd1b3d1e..bef3243e9 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -38,18 +38,15 @@ extern "C" {
  *
  * These #defines are used in identifier tables to fill in the version fields
  * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_LATEST must correspond
- * to the latest version value among all versions exported by the D compiler.
- * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
- * it along with any suffixes (e.g. Beta).
+ * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
+ * string that contains the latest version within it along with any suffixes
+ * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
+ * and then add the new version to the _dtrace_versions[] array declared in
+ * dt_open.c.
  *
  * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
  * explanation of these DTrace features and their values.
  *
- * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
- * and then add the new version to the _dtrace_versions[] array declared in
- * dt_open.c..
- *
  * NOTE: Although the DTrace versioning scheme supports the labeling and
  *       introduction of incompatible changes (e.g. dropping an interface in a
  *       major release), the libdtrace code does not currently support this.
@@ -85,7 +82,6 @@ extern "C" {
 #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
 #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
 
-#define	DT_VERS_LATEST	DT_VERS_2_0_1
 #define	DT_VERS_STRING	"Oracle D 2.0"
 
 #ifdef  __cplusplus
-- 
2.43.5

