Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006841A275
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558522; cv=fail; b=JqcUKu9ElEqNyTlUcxofl2PaqUrahMNJZKdhiXY3OHzHAP5xhb5ez5TZMOiJJRHowk+Js20Ov+1M2jR+ZeQdDe+ytVfoefDVjRi49vg6t17mKB1gPD0QYXcibDxfOFOQtLGgqnP+JIJ5XElafLcMGIZEtoXws6XRXvFzmYdbeyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558522; c=relaxed/simple;
	bh=1L/uu7DWGAayi7+NipIy5tSpmT+Rz57u1D+1QncK9gM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=AzW63C4BtFgf8Ln4MLNuJFcVLwA64SCJVcC9+K+zTho3G83YMAtp/LktAc6imB5SsCO1QN5YfpyRfRxhIrRcTD5X1ecCaw8fdm1+MIf16B9oJh6VrfabAMDXIGn3tPDvZFxRylZgVtBzCdFT59GpHzlQTIg8XOSvbF2xOCdCypA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aineD3ag; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K0C3xHXg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aineD3ag";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K0C3xHXg"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1ZSl3002355
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wHI4bj13323WYf1Pn6O3sQLI4MXYgXLQxFcZ8CIG+uI=; b=
	aineD3agry8bsuVW5fHz6Vkq9vTv0Z/ugK9Y970isc5Abl94mt+U4N7d0EH4KAGk
	zD4bqerrALjn+R1w942sLyyqRnW3tWHqC8ONF1zwiUUhqKwlUIQlhRlx0OX2QX3H
	Qav5oAU6yD1GtcPW1xlpyntXu0NB5RBCeSUdnYDofXYngc3nZjFaJaIlJlpNQm1L
	N/gjIbU0YBiiPvpyK3/7gsfPyN+XTCeIRy0TVk3/KhhGr4Z+m5J75gTnP9jQeQ/B
	X3WX+WtdtbeiH2h/b3GzkTzXZyTmdtFzaIMG1Z9agqN7JVUEspu14I00qs32p+wh
	1NT1s6PB7PDCsp8bMKD3eA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1aww53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F40KRW030471
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59fstf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHIQBaNQfhYAa2iVeV1HENbwqHsIgSa5dRG3nz3Xvc0sUgqukdNt+BUqV4Jbut8GdVhJt6a6aXUhUam2zVG1WmtjJgHX/NQSclc2LCtwqjfM6XcnEy35f87PbrCS6dVbwfZYI3cKz8d/ZRa93+WtZ0bxIXw/mCJKQ+htJeur69VxscknlAPFOYo8qbjI+IwKWCannZkx7G2o1tINSKddlfhgo9YxOEhQG6v3BqW5w8OOw8D1YG9B8SnhIq6iIT7fqjFn49j724AuKHPBClVcjpDW4M9vjExMXtDPeNVhY/yuFW+uyr3WOQfBZA2m1kWy2TBjfwcXexrRtQsc+QuJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHI4bj13323WYf1Pn6O3sQLI4MXYgXLQxFcZ8CIG+uI=;
 b=KmcAkNl6PvSL7Na/H4X/36KLvR/iMCCiOwHkglcs3VkxPTO6c8F/cIkgTYG6l0h/8WXUPTLIZomFdjsS4DfIZtLH91L/XpjQ9URmNobATzOddW122NmM9rI/fgib7ZZnhQRv+lizFOBVf1KAQgXgKgUwwHNUVyYpVZumxg9QLR1Fx4BiTrG1JNhDwg8uzt88DJAsCId1bqht/ayWTB2/QkqX0TGpSFdIFOnQXId7uxmIdDkpn/l3DblJ38YbTxdSWLY8lJWtBzBUdZ1foW99YLMpJ0phIuma9xuyTS2fPp1fdBFnIDZdQ+fyb4VsiBzfHUsRHBOvfxBgjkySUXx8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHI4bj13323WYf1Pn6O3sQLI4MXYgXLQxFcZ8CIG+uI=;
 b=K0C3xHXgdJoYCqfMO+3w5VWGuund3Ex1k0ibEJ4aAzVN1ENYmBKHewzk0DAtW/sz1VSFFudPj1NjqahvsI4/Cj64mgViF5nSzqNF/H8GYy+fAkFOZzGMCXtA4SDLSATLakFF7gOADa6X5oT37B4m1EioS14HxRpUvcaF7X8lKq4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 05:48:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 15 Jul 2025
 05:48:35 +0000
Date: Tue, 15 Jul 2025 01:48:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] rawfbt: selectively allow return() in clauses
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: f7846228-80ff-453f-dac4-08ddc3633d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m2h4KQjM1lz2RNj4JcKqWD0Q2+TRU5ER5mPg3Yrt1rSBsNUACd7ip90fOq8f?=
 =?us-ascii?Q?FWz2h5DPa2WccTSzmMwBrFZ0+Bgc1pu1YP/d6DSc5pqpx2f7qgXA7hVWBogQ?=
 =?us-ascii?Q?yAROxNRth5NhmYf/Edz5fpr8Hegf5FCc/FJWbGb1HpBAkUQ5Humlw76Af41S?=
 =?us-ascii?Q?GXM+LfTYmExAZhTMdIGQuM0p1/I5QyomOlEfvgZlgLDmrtPKp4qa8vvlDJTS?=
 =?us-ascii?Q?l77mgWvkdWSX5LZqKiOcFwGWeh7emmyfU8frhNsQAqfTczm6qCr9Ljps4Bdb?=
 =?us-ascii?Q?8Lvo0QOirOaRKux8GWt/Rfl+bdj/b5KNISWqkOyDqj9VnNYBNt3Xu2yVq9hp?=
 =?us-ascii?Q?mVa3qCx2QYvhAEPEiGyjrBeChMNbovfMD6qU7INWsYKhLY0RLgf04jniEB+K?=
 =?us-ascii?Q?bPoqiIfvmTwxJo61sVdVLEnBC4TmnqcEFQ+DVCTvnO8yD0k02VQYuRbnHJ0a?=
 =?us-ascii?Q?r1UiMT3fEvlqM1s8V+CZrBBZ06iGOimxzezeE+gl83e44ILt1/EElwl+S1Qy?=
 =?us-ascii?Q?BW84N9x3ZaMZtNpsjeDbs3mWKx8K9O7teKKZOCNMSLCdq1JAA6oEo5/WaRye?=
 =?us-ascii?Q?1EemqH0kv53qS8usj+6UDOOfD7jVeYyx9TzagxWXlZxMhT6vp3NnHl2mnssf?=
 =?us-ascii?Q?2Wr7ajSG+xdc/JaD2taloJI7LyjREQb8CGthkc/wT2a+iU2ufmpq27ZHtHpS?=
 =?us-ascii?Q?BOYfI/N4fXr0RyaA9q7qkggGV9TjWRo5ERNfY9MRfjSO0HDR1AWfKbAq1Yp6?=
 =?us-ascii?Q?z5vcA1ZqeYZma5uJj0bQo6xRGKKgs+6JpHi5WWTyYxYXBtdhh0Sri+CuLAYL?=
 =?us-ascii?Q?F8L1AzbXwcb3Cg3ne41+ysNNB9Av32emmK5U13FyJ6o7mRPF7e69N/9K9Yeh?=
 =?us-ascii?Q?4Fssmjr208TEVpkv9KBrm1TIAcYTGxyq7UsNtHM4yqLuze3KXxIxorLZa2pe?=
 =?us-ascii?Q?+Hv+hHJJM2FD57y8fdVdhBkYqYCn+H9iMnO6E9dPtEb3ng75LQffjHu3Ff+V?=
 =?us-ascii?Q?HifZrA1rUcIPf9eliKGtf8IxDhgY5YLJS4fcrxrYl2lLB5QBidom2pOGT9fq?=
 =?us-ascii?Q?LI5dr3C3iCD1z+YS8Uvd6/iRI51XJ54aeNUDw3Q9xAfNy/iHkTo46uYv3I6j?=
 =?us-ascii?Q?sudIK53XSjraSTnQp/5PaNY/p+AAPxvUhmjpORLp4je8QH0rzvQl5wFIwPDw?=
 =?us-ascii?Q?KHfh5u5Cnyj9GGaADAxVgz/KKIENvHpOOATQBKk6UstOY2ua1i7Su4sUVHf+?=
 =?us-ascii?Q?0dTkO/xEY5SGS6hr+hrTr9OdEwuWhgjnOJynU7NFJy9nkmIv4atj6JUmfcZd?=
 =?us-ascii?Q?5ypTn1sfDQ7o/yTb5yFqARx7cnhwQlstQT0npPtaCBpqM7O5iOjLLhuKyJJ7?=
 =?us-ascii?Q?2q9VtZ1ff3TLS3hASTJR6k/W+rOPK9TlDTwyNE8dRbbLfVOJcyjqHHQwSkDZ?=
 =?us-ascii?Q?cpMSL5wQpAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pXV01CBwdKYshIJxHuKylysmCuiIRCrS/rdKayikuwbvs+ElHK0eNkC4q6PI?=
 =?us-ascii?Q?VDsBOdmZ6k2sqN0bYkqHReX8DGMk415hPqOpiPw80tbuh40+yEnRGKUQPvT+?=
 =?us-ascii?Q?vi9/0yfOLOlXFqrYZcGld0APJrEQFuu1Ubrpjg/nQ+KwnmsiklKlfRSv1PEx?=
 =?us-ascii?Q?29JqYjkWVrFVj0SFWNe2AncKIJ6vgma6OkU1frZHP7E8cdgms3xRIJEfL4hi?=
 =?us-ascii?Q?JzpgYEipkD1geplcL9egHdDU02hvf3EaKoyUeBlpwAvm+9afMk8xKbkN5tXd?=
 =?us-ascii?Q?KEvwo/A9pMUVlfy2rwlOZqzjGhtbNQ3nCFebbsPtAmyw8K7SKlusE6MWp+cc?=
 =?us-ascii?Q?uvG2wAHWUabVQ3txE3o5hOmB9/5rk9YGykX+dEnomplK7u8LKp4A1wUxhQeF?=
 =?us-ascii?Q?LILMt7dvETYDtGBXJ4IH/cpeG7TP7F6AFrDzzwf6STYfgIYKGUjFA5d5mnST?=
 =?us-ascii?Q?8sLXalyS8T3ke8DbINESwW/eEvEA8X8wdKUM0xJxIXKA6i1NOvC/iew2V58W?=
 =?us-ascii?Q?Ic0OIU28ucYfJaoSMqlcCoqPTXHanW1MzlKZK3t3gsNWVR+ZSZ0g4hNXpPUj?=
 =?us-ascii?Q?HOr8TmUkypSl04GtGSI83+KSEGmb0F2+/7t7TnBy0ov/57a0/X6+YqeTMM8u?=
 =?us-ascii?Q?e1d1apcqZ2hwnAjAZQLhY64dl0GQaFap1E/Z9h2hiX+Gl8h8x75Tc7ETRkqv?=
 =?us-ascii?Q?yHHaoCachz3+5p5pHlBACBWLw7duxm/wPVMANC+PkdYDBMg8azDXwl1j49pb?=
 =?us-ascii?Q?c0dHv34oWFkA0UgC0EUzoWpY5umzNlKqoLs67wg3j7uUl2vU/kVSsgNR2lY9?=
 =?us-ascii?Q?t84ExCeY+3maNua8v0VDuVTXyiQGw3anSuJnobAv//Cs04btl0sntLrmkRWq?=
 =?us-ascii?Q?3NF7PefE6b5aM1CUnSV/jkLjNYtJ26oZTpkiLgs2DGG/9TA/4zb9/7MnMnuH?=
 =?us-ascii?Q?8obuXsnEmnc31vscHAs21Rj7zblsK8inmJZXImFRKRfeeggYkkyOgl6F5Ern?=
 =?us-ascii?Q?eGzj8XIP4UOos8lz9dj0J0UoamoToSWv3ctiNwWbnn/gqDwDE6tNTO6+f7T2?=
 =?us-ascii?Q?2v+bwr7Nl9M+PFJSDLwBf5zs5O+Fm1Qc9fqSqJBDMhe41VclRmxGIlmRZZ+Y?=
 =?us-ascii?Q?CFCOM6UWvKpCuBXfXHCtB4gyCPoBUgXaGIrJ9EhYWlezOhynD72v27VdL9pf?=
 =?us-ascii?Q?cX6ajUfPprfIAAcnKS6wrDCQhZiUA+WAwOTsLPwH26TlAmB5iykZq8Gn5HUJ?=
 =?us-ascii?Q?nvV55n/P/vW8nd8XCpdMOGMbqegx2As7PZ2PBAcdnSSp1n9VJtoMsGVr+m/9?=
 =?us-ascii?Q?k/3L8/M8dZgcHbUtOsrIfryS33bcxC2fbw/VYl2buNhk993MDIL8AmnPg3aS?=
 =?us-ascii?Q?cNeOIg5ujZg8XGxPC2WhkQYqMYjeDc5x5YWxGraK5gyVWlAjt8yGv8LMFNWZ?=
 =?us-ascii?Q?frTJwQReeYo6bc8LKVP5JCssUTSpokDl2xaHH3sFNuCTrv8hxv8AK97b/G9F?=
 =?us-ascii?Q?7Q3IdLTsWXY6H9itFuIy41hSLlG0jSEgYbpk2FIfrXVvfmL8kSkepsqqmtwQ?=
 =?us-ascii?Q?4uMEpE8yfDeGTq+tN2J/kQPQmX+ODHYZTp/4feibYk6sXRCUQ1nD0/eLV+XG?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9McFwzrzP13L1WashY4Qngln1UxZ0wUP1dIBx9MwSfgHIxs4K/WnzD9atFHMjNoD7RMSxiVa73tEoICWUSTqK5K8nARFDhdWw9vGFW7I39V/pPrdLiHhkaDkXi68B/aldHqXtNo5OXwP9L2dmf5r8b8QAe94GSkyiaGgeHySLYiRRUhKGoxVhPHxhi/59+fbLnq/X3fdE+vByfDlIkuwsSCMynyegMzjqvEhBnfb5rSzoh7JL0fSmP27UapQM0UuAEK+HuoC4Y4azJRNtL9j3xjk+4mNM1Hj/nNIfAm9/lhEUdX6vfuF9OWUn0mlTCUTQZuch8ejOQt+2lqUAhcoF+SI6DFrwzRj8o5tJk+ngWctsABZlr+yWh0TOVhq/uZKj5ZOWOQV6Dm7qYY9ep7o0gBhmbgkmCLqp3Ujd2mDsFmdTx8YEbMEQTLkvea+lpHOh5QBYFMl1Tdj7cPt4D9J0WataOxybtjKd1oQeIvtaftf1rSqcnLBXd74o1J6Z5vWV66jqebU4tXJVcqvGbOwzpYUm6JwCmYBocG2MrYIugd4TBiaUDFwYcxoKvlQzNFoWwvy1a4UgbcLjaGifLurskH1AIu0sq/+LJQ5QXAF/kI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7846228-80ff-453f-dac4-08ddc3633d74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 05:48:35.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+N262wTWXod3mSYDNrbIDhdpvtwQP+yfvUdBy9630mMZce7MUsAEh6SaMz05h4/GarObkVrTy9HnIqJ+ow5Y1LlJhml+8D5zZWBN0lTxK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507150051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1MSBTYWx0ZWRfX2HbITPYxA2i6 fiynAevbe6fmFh8X7LJfj2s8u5cOfjiOYVa0YKkvt1Rpwhrq+SYmKgkXCnONH7JCJSAU9BnQdtj 7ONci0EP3YjHCjQyl7voGCtA1HsF4fSWCvRxlMrn6C0owggMXnnNLGlf/tlu+VAb2f3JAQBhQqh
 HGq/mVHz9QuBpY8UbpJy7DcMc+e/YpeKD3UoajNLpDUnJPWuB2BRwkThGw7ctOb6N3eEad+a9Lm c5beqr7Jm3obLEDootE9NEVHhDNaTAOCTVBftPRYYZHlQqDknOC+Ct9KVLHY8IKlr5f6w9iMx5g bOYh9mX1Fr8rImXeZi+AEgruz4etXfbIV9yBjiluWhN6EnWZEfJ6eVaSkqQVXYYrxTW9v+wDyfr
 8k+uZ30Yj1xYdqakglGDCL4/mGkUe2mqYv+dG7HIZkWlCbC6uAdPufUmhsXKkzt6NUc3CMFQ
X-Proofpoint-GUID: ZhBWL-IwnLqhdRvqavvTySm0ChfjlbMT
X-Proofpoint-ORIG-GUID: ZhBWL-IwnLqhdRvqavvTySm0ChfjlbMT
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=6875ebb7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SPR5cAPsjz8k-MN_UsEA:9

The return() action is only allowed in clauses associated with a rawfbt
probe on a function listed in /sys/kernel/debug/error_injexction/list.
Use a reject_clause() callback in the rawfbt provider to enforce this.

The list of allowed function is only initialized the first time it is
needed, and its content will be stored in a hashtable for faster
lookup beyond the first.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c                       | 134 ++++++++++++++++++
 .../actions/return/err.not_allowed-1.d        |  27 ++++
 .../actions/return/err.not_allowed-1.r        |   2 +
 .../actions/return/err.not_allowed-2.d        |  27 ++++
 .../actions/return/err.not_allowed-2.r        |   2 +
 .../actions/return/err.not_allowed-3.d        |  27 ++++
 .../actions/return/err.not_allowed-3.r        |   2 +
 7 files changed, 221 insertions(+)
 create mode 100644 test/unittest/actions/return/err.not_allowed-1.d
 create mode 100644 test/unittest/actions/return/err.not_allowed-1.r
 create mode 100644 test/unittest/actions/return/err.not_allowed-2.d
 create mode 100644 test/unittest/actions/return/err.not_allowed-2.r
 create mode 100644 test/unittest/actions/return/err.not_allowed-3.d
 create mode 100644 test/unittest/actions/return/err.not_allowed-3.r

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 50fa0d9d..b98d8d87 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -591,6 +591,139 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 		free(tpn);
 }
 
+/*
+ * raafbt only:
+ *
+ * Accept all clauses, except those that use the return() action in a function
+ * that does not allow error rejection.
+ */
+#define FUNCS_ALLOW_RETURN	"/sys/kernel/debug/error_injection/list"
+
+typedef struct allowed_fn {
+	const char	*mod;
+	const char	*fun;
+	dt_hentry_t	he;
+} allowed_fun_t;
+
+static uint32_t
+fun_hval(const allowed_fun_t *p)
+{
+	return str2hval(p->fun, p->mod ? str2hval(p->mod, 0) : 0);
+}
+
+static int
+fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
+	int	rc;
+
+	if (p->mod != NULL) {
+		if (q->mod == NULL)
+			return 1;
+		else {
+			rc = strcmp(p->mod, q->mod);
+			if (rc != 0)
+				return rc;
+		}
+	} else if (q->mod != NULL)
+		return -1;
+
+	return strcmp(p->fun, q->fun);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(fun, allowed_fun_t, he)
+
+static void *
+fun_del_entry(allowed_fun_t *head, allowed_fun_t *p)
+{
+	head = fun_del(head, p);
+
+	free((char *)p->mod);
+	free((char *)p->fun);
+	free(p);
+
+	return head;
+}
+
+static dt_htab_ops_t fun_htab_ops = {
+	.hval = (htab_hval_fn)fun_hval,
+	.cmp = (htab_cmp_fn)fun_cmp,
+	.add = (htab_add_fn)fun_add,
+	.del = (htab_del_fn)fun_del_entry,
+	.next = (htab_next_fn)fun_next
+};
+
+static void reject_clause(const dt_probe_t *prp, int clsflags)
+{
+	dt_htab_t	*atab = prp->prov->prv_data;
+	allowed_fun_t	tmpl;
+
+	/* If the clause does not have a return() action, allow it. */
+	if (!(clsflags & DT_CLSFLAG_RETURN))
+		return;
+
+	/*
+	 * If the htab of allowed functions for return() does not exist yet,
+	 * create it.
+	 */
+	if (atab == NULL) {
+		FILE		*f;
+		char		*buf = NULL;
+		size_t		len = 0;
+		allowed_fun_t	*entry;
+
+		atab = dt_htab_create(&fun_htab_ops);
+		if (atab == NULL)
+			return;
+
+		prp->prov->prv_data = atab;
+
+		f = fopen(FUNCS_ALLOW_RETURN, "r");
+		if (f == NULL)
+			return;
+
+		while (getline(&buf, &len, f) >= 0) {
+			char	*p;
+
+			entry = (allowed_fun_t *)malloc(sizeof(allowed_fun_t));
+			if (entry == NULL)
+				break;
+
+			p = strchr(buf, ' ');
+			if (p) {
+				*p++ = '\0';
+				if (*p == '[') {
+					char	*q;
+
+					p++;
+					q = strchr(p, ']');
+					if (q)
+						*q = '\0';
+				} else
+					p = NULL;
+			}
+
+			entry->fun = strdup(buf);
+			entry->mod = p != NULL ? strdup(p) : NULL;
+
+			if (dt_htab_insert(atab, entry) < 0)
+				return;
+		}
+
+		fclose(f);
+	}
+
+	tmpl.mod = prp->desc->mod;
+	tmpl.fun = prp->desc->fun;
+	if (dt_htab_lookup(atab, &tmpl) != NULL)
+		return;
+
+	tmpl.mod = NULL;
+	if (dt_htab_lookup(atab, &tmpl) != NULL)
+		return;
+
+	xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
+		prp->desc->prv, prp->desc->mod, prp->desc->fun, prp->desc->prb);
+}
+
 dt_provimpl_t	dt_fbt_fprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_TRACING,
@@ -628,6 +761,7 @@ dt_provimpl_t	dt_rawfbt = {
 	.populate	= &populate,
 	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
+	.reject_clause	= &reject_clause,
 	.trampoline	= &kprobe_trampoline,
 	.attach		= &kprobe_attach,
 	.detach		= &kprobe_detach,
diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
new file mode 100644
index 00000000..246a68b1
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-1.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: return() is not allowed for fbt probes
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+#pragma D option destructive
+
+BEGIN
+{
+	ok = 0;
+	exit(0);
+}
+
+fbt:btrfs:open_ctree:entry
+/ok/
+{
+	return(0);
+}
diff --git a/test/unittest/actions/return/err.not_allowed-1.r b/test/unittest/actions/return/err.not_allowed-1.r
new file mode 100644
index 00000000..e3443c30
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-1.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: could not enable tracing: return() not allowed for fbt:btrfs:open_ctree:entry
diff --git a/test/unittest/actions/return/err.not_allowed-2.d b/test/unittest/actions/return/err.not_allowed-2.d
new file mode 100644
index 00000000..e0d303c7
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-2.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: return() is only allowed for select functions
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+#pragma D option destructive
+
+BEGIN
+{
+	ok = 0;
+	exit(0);
+}
+
+rawfbt:btrfs:close_ctree:entry
+/ok/
+{
+	return(0);
+}
diff --git a/test/unittest/actions/return/err.not_allowed-2.r b/test/unittest/actions/return/err.not_allowed-2.r
new file mode 100644
index 00000000..758d3477
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-2.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
diff --git a/test/unittest/actions/return/err.not_allowed-3.d b/test/unittest/actions/return/err.not_allowed-3.d
new file mode 100644
index 00000000..770565c9
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-3.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: return() is only allowed for select functions
+ *
+ * SECTION: Actions and Subroutines/return()
+ */
+
+#pragma D option quiet
+#pragma D option destructive
+
+BEGIN
+{
+	ok = 0;
+	exit(0);
+}
+
+rawfbt:btrfs:*_ctree:entry
+/ok/
+{
+	return(0);
+}
diff --git a/test/unittest/actions/return/err.not_allowed-3.r b/test/unittest/actions/return/err.not_allowed-3.r
new file mode 100644
index 00000000..758d3477
--- /dev/null
+++ b/test/unittest/actions/return/err.not_allowed-3.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
-- 
2.43.5

