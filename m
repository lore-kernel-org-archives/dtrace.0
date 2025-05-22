Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0A19D8AC
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937427; cv=fail; b=CsoicUE5Z+nIMZ4f6AToheFF4Biueopj541T82btFzUiqrasysko1fcvPwn8zUwizGQiWVJI6f0fVGctRP4WEey4Q0Y/2RpyH2STzaByUr8vPa4f8o9PH4b4XAliCb8Y2p4r4NgVVjD3P+ezqdAuC2Gou87VWd2P/W1Nd3tIuXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937427; c=relaxed/simple;
	bh=R+cckoPIvqE848aOZkCgwSyR7I3NXM9s4lpeNrzDTRg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=luPjRoDK6vrE98eajCqpcaPT9Wtq7nMLtxBHhWeTbuFwSdo8LtkyNlXS0/6/fXjys2o91IQmfpzsLXFM2EHsUtJ0lyk6aZDMu3aH7G6L0Q58apDZzF0zsSzZdl59LDedI/S4RsSO3B87Q5EC5Zdwj82aZLMa6WZGLQXj0kjg7Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JXKtdZuu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H1kX8Q8t; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JXKtdZuu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H1kX8Q8t"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHw6kf017370
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CE+wAXRtWb+RivAFKBtztGZ55W1FE4P/jxaKN+pg3Xg=; b=
	JXKtdZuuePiySu8bTTIgIhsk9gYsHb07cd0PkVbC8DVess3jA93xumw9QRipFoBa
	9NVbe7Uf72F0Pq7nKD6fTm1xQqS4UbSg/f5wgvc8NAJKgLn8Gmcw91ZlTBkd2ZWH
	n7ExZdW6VFuaeIpqAX6UN/Qx1vQ+KS+eJ+Sia8aecltFwlMBV4wrMC7vqS+AhgJA
	loXrvQOCN+NVuWFTeS6kKKks55EUJpCrdZmavpSpjkZvm4+/+rtqpCwvUSZ0sq+k
	cKAwR1o2ZgvORtfbuNtQmnWrl1xM8X86QlzxH7aaZ3kXuhTjn8/oQSRnrqtydn6R
	zvgEBECj0JLWKyTE9xpMrg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t8s5r0ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI1xII001729
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweu0yhp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg5DoZFKBuoNSfM44fHENZIA2frC2pG0WPZ/ooxpnNGmDtXROa1QKD+1e9Enz7HsfSFRRsh5odaIolft9JaQbv1Fx6+YAjxVS5HDpLT7DB1IKNOiaTyokGqAlM54j+/cf/LuwKT9TzIGRwvP8C6FM41tIOBXJm7Po6l6OeqFSbrG6GYfzEXs7LVktkbLBNF/BeHnunEsco9f2dT2jcLNizGpEGmskDruE2z9s7KrfhLkJb8SQOBMpaRuDFSx4PMJhUNa4z0m71YJDAdTb20f2UAu7rnrwZN/sAqF2T/HfYnVRffwjr8mpCFJkWHX2ortcQtU6uE10aJRgCRAib13lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE+wAXRtWb+RivAFKBtztGZ55W1FE4P/jxaKN+pg3Xg=;
 b=KYEc00KqJN/BlZyit2CcRKzrpH4xGHbUbw+Gq/OA44ZhcPIi5bhQJeOlemY/boLrqI7wSzQJppOnnVUgnUWhKRcq3c56EQ4LG9kVE+FcnE0vDl4g8av6woiq8fX0ZvsPylbOKxcnIkw2zTB3K0mmgkbcNF+vuu6nO/KujyLSsEPBows6yAj4efWx1DF5GtyQ+ctEk0Wc3OYdgj6tYmp8wL3h/zFnqfZNpxsyuc3AO9ZTIL3yPrSROLzlOCWmLZWqOgx0g6K2UvgvM94vw9l9TLS0MMN+uHX3cRUPlWyuWENrqND9/VJiQ7VLyN2mrq1yhj6pNzR62e2PyvUrSyk3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE+wAXRtWb+RivAFKBtztGZ55W1FE4P/jxaKN+pg3Xg=;
 b=H1kX8Q8t1bwgLHYxiVShmVdlYlOqvHQqiyJTejP0IQmFqZaDMPtquFEduKzid8EgnQh1z1xDQ2YEwPdOCqf46ZjqXG/o16eMD7FhL9iv1BdLIo46a+eZeWfD6r6upqzHBXTOtWh8eMfTECuxasyI/Oa5kskeEnBq1q0xhxqpmFE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4438.namprd10.prod.outlook.com (2603:10b6:510:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:10:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:10:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Revert "dt_pid: pid grabs should be shortlived"
Date: Thu, 22 May 2025 14:10:16 -0400
Message-Id: <20250522181016.27661-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:208:32a::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 2038c2f4-1df5-4069-1845-08dd995be966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PafRODa3hvQrUbLA0ER0c/UhIYzFQYm9n8rpwXevsKysGwW05vh69sD7FOgU?=
 =?us-ascii?Q?diMFOSyaLsZOY/Zr+vECPoYHsUJBTLGKGyIy2uxexZNNBcsDV+YHAAe9H1W6?=
 =?us-ascii?Q?es3Mi6QvrfxHUY/jEFfLJjm7QHHQ+wTnfjs1TlulqQsmiTXEvMF/1z22bJf8?=
 =?us-ascii?Q?jlUnH5p4jLrbj0e6ZQod/4GIXYUNn1UhSFWL0u8OdANkFHsMWYrrQxqFMvEG?=
 =?us-ascii?Q?Ec0z9NjbO8hlDtU5gtLEpceATCNv+LklFTJDfKGa2zuGmTmqKNusqkjsnbc9?=
 =?us-ascii?Q?ECXpmIgcN5QTic06iCHa4W9O3ptPWKHNPHShZVZQvunoCGXT19FOMQHd8Irs?=
 =?us-ascii?Q?5LeyO74Fotz3vUupzyE+tfwa9JJOz3s8RR3HjxFz8ynLE6Ws3cI7k4/Qienf?=
 =?us-ascii?Q?mUCdzkKpf0WUb/msJNj2TDqasWW9QdY1XQ4CLRn6G61D6VCm0Leb47wgm6dr?=
 =?us-ascii?Q?AozGnY+jImp+DhoyXz2ktjYSvYZqJJYWRRWAdRzGm5MRiyuuhdpGUx2+T5IB?=
 =?us-ascii?Q?OLY4DFQStiABMV88hgspb2cxLWo63CDuuQkrndl2Ct8CiYq4JBQq9wP594g0?=
 =?us-ascii?Q?dW/zvuFLNlNCkUQyBiXCTHI/eMSW16zK/OY4+CG2X369fADNPci66C09x2pT?=
 =?us-ascii?Q?SPmFwsZJFxhmBblolKba5EBed/bmpciWGV/cpck+FGHqcm7oqiWrf1MMu4aU?=
 =?us-ascii?Q?kmkIWIQzsQ1KLHWdZVxIMP2y2zNB+7Qijzre8AkL3Fr/H5dxiZwqOoL5qIEV?=
 =?us-ascii?Q?7xtUQ0xeaVYct03zfBp+YRDOSu0fi0ZphDeoyJDw6j5DU8Z5K7QQ5q/QLXDL?=
 =?us-ascii?Q?DMTFdkKb/8JCtpeboUdkN2jK6FG8Uab1zKbfPH1/G/eSdA9b4I9798YyXlA9?=
 =?us-ascii?Q?6AUK3UOIubZhQMN5mNDYcKAkEBwcr21Q4GmLSZEPve6+4utHJbn0GJbQ7l8a?=
 =?us-ascii?Q?mpYmeDBo6K2pBZvXJIRV8U5IWshoIQ3tA4DEHduaSM/dMMmNPxejPe4pBJ6B?=
 =?us-ascii?Q?TBZZl0L4LiVPlpIp7qXjRv+rbIZydJJQnKgMvbq3pOaPFY2Fg1Zzbi75qfO4?=
 =?us-ascii?Q?esHNvj86538aGmfafyHNy+lrXp4FOBn4TQeoKBOQoj8tzuLbJoKigTHmbB0h?=
 =?us-ascii?Q?EPe8w2+q+jy3u4u23a7C/UfuXH9OQUtNtwDmk/vxSLwvPjT80Qv1Nr1vnI52?=
 =?us-ascii?Q?hg75Oj9R1vMpKPwZl51TS9L+/qL16J0TuxVVOyw/NN016RgU8XdH79eRijrx?=
 =?us-ascii?Q?C2GI4XhYxTYWFYUtzLm5lCADI3d+vWet4VxqySmfTzLeQCtTc3KMDRfWKY1X?=
 =?us-ascii?Q?EedOdcRUW//IqgojUAN7rlqG5QCzzc+DhlyUm3VxBTjb76U3ZCePL7YzUX5V?=
 =?us-ascii?Q?XP83CdpHhFe7FwuU07/xT+/HDi5iY9+x7U8Oh22bLfr+RaqsHAjWiHHdLPgf?=
 =?us-ascii?Q?Q02M7uVexLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5EVHAJBjzTm5OAjVg8E0+GYuQ2k8IPnnz7P0ascXnxXyPOxrNu/Q0iEo8sVX?=
 =?us-ascii?Q?EzRnQmKAQjVVyJbxkj3TAhtUaoBNxS0Jjdcl29NbrDOb1ZHUi+GKa9NtYlGM?=
 =?us-ascii?Q?HpWrb2sdVzqY6+cCBUAuVr61jtSpgxW6FHhH5YR+emThDkrK8wLbgkrggQkH?=
 =?us-ascii?Q?GSZynDLp3ujn6CoTz+dS1lYTThShs7+imKIGMofDXjSGF7lhIELbImQP8e+4?=
 =?us-ascii?Q?PRTMHXyoIol/hv01lYKUk7AuACuEFlmZzAnZv/jiFSZVfAPQB1nV9rU8Czid?=
 =?us-ascii?Q?oR37oPKUQvSw5+V8/RCK4Wg2Os707imeK+9cniOrE7pQk2hbJ2E133QOs3GY?=
 =?us-ascii?Q?cSNAe8fSJYnSoqCQD08VQmdB8JDd/qUrhD+KcNeG7WUWxkWJHuWT6GLW9Xzv?=
 =?us-ascii?Q?cx0hLJri8RAeK0sfEnLwr54Z/GZNY8xhpD7qdmVu1XBHDK+4U8veIRrsEQNW?=
 =?us-ascii?Q?0Y1Kmc3QtluWZuyNi47x9P64yuP7PbBkgPPgj3L/5Mh45v924d51COY7uaoE?=
 =?us-ascii?Q?UwpLG8q8dc3I7wIwQ5TOopdEs+NUlScBpJ82EPQzallUTva02t1TBS7Gis9y?=
 =?us-ascii?Q?tQNEwaP4XOeT2bS9Hnw9j5a5vGdIUxd9CbjTkhE3nSX3BLIA+hIoDrBpYwfj?=
 =?us-ascii?Q?5U3rdAorpz2s74Aps/y4bVAW/ZUtLP0rf4ytWfnj+LiAplg2PJsSuSRZrI7t?=
 =?us-ascii?Q?A1aXCYiiSu/AZyHp4ZF5eO4xT2PQtPw108RVjkoZV02/rmVJsw6ECm8Bi7Bq?=
 =?us-ascii?Q?ycolc4DjzG3w/dkz14iSXgv467EaBTzSAWWsg7jki88yKzPaTdJ5LCV7YD2p?=
 =?us-ascii?Q?MdNseVYBt5wjn0HPbqy0iK2+qaqWy4/nPC5P0jeIGA9Ezqlve30Jb6t0c8Y/?=
 =?us-ascii?Q?22Erlu6M8Jzklcx8epiqZJSL/GEu1V2kspBh71QIIVTJjVR6eqkEDxBWj40V?=
 =?us-ascii?Q?5AujQI4xahlmXjXHtHl7ohAx46RjZJi1cg3vysEp/p/nh3RgsE7k1rYFLkMf?=
 =?us-ascii?Q?blkVv5J5cI4FWKST78JoPDvjplkZqwx7B12k7HBzwGQ9HXE7N/BVmQ1C9M6y?=
 =?us-ascii?Q?T7PWEtOYVZutaql+NfyXgR8Hr9My3pPFTzsdSOq9Fe42V9u3Fto4RDmwPASX?=
 =?us-ascii?Q?n4b5DjkVtFkjdCOMkm+IcEF5mxQJq7SvHIDKG5OCIz5M+aGa1W6kDJKklD7x?=
 =?us-ascii?Q?KGgbWSAQGGaxe5yXE54PhnD/Zq7q10nt6sIWi6bDpIlopVC/zPj6weaNTHN5?=
 =?us-ascii?Q?jD080pbQ/BNzhlmBQ0nfrUfRHTz2MHgyk0nRCzGzBsbKQpqwaVYAB8JrqGJS?=
 =?us-ascii?Q?aode9QTgJ9bOSZY57AxmM7PBLMbD2w0kmaOnUJu/0HD2x5FepS1MDY9dEuk8?=
 =?us-ascii?Q?OGsmvKfgQphz0N4mC40U158f+kYBzbVmde8u7PIE3SMJ/S3h7K7w61aXyqNE?=
 =?us-ascii?Q?5NdWvw8YFTzSvLKdXKFhGAAbxTsGgEvchRGiOfahZ5GBbEYpBQvDVgXHmqp5?=
 =?us-ascii?Q?CRgJ04nLsE8T/799vSGeoMWnsTQpZ5P2nYq1SEDTuHhmnvZUOI7tBraa3DH+?=
 =?us-ascii?Q?ecoHjZ3sAWyuwJ9efJNW+tORmd5U51oB++MTpXC3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lYUzPWNIiCk1OgMiyo1cwxIInIIun9ygRVLw1y/gNHsuew6opRc1OHfjRjWZ/2Watd0D3AbKs5wJqZe78caiaywiEow1lc30PFFXJ0R6DKUbnlgdHx+NuI+jTQwpQj/6VJEKDbtxQs2l1ZkCZ19tmbDA/urbwSq9MEwOMnLeAqN7V4+XF/iQ0OrwcBQMoIXUseACFPxir1pQ05EEpT9C/icAVgQB+WnweJVQOxHXkvZ4SiybW3YiFNylR1pG0zB7mfPCx0NCMYAoPqhJuTuughGIE9CnCPlRhVH3yJ3KeP7l5zFTEdffsaIXR+CWcal2kFXu1pLQkC6npVG5gkRsyhBfjgA5BVljcNkxaTpshZHnFINdzPMUuFjwKHKhTzMnlpe9HhLfxDtOsXkgooJ8RcXQJtcjUIl0J0YsDYo6t4XJLGyuVDLCET87WRHmwwfVQbzxuNVMMqqPTuqbo0jqRze2nUsahhzxy433c4SdaE4sorOCHdHPbgt6XmwMt65FZclAaH5/xl61fcu4wwbcN/ZG6VnS0Ih99RzT3qt/vnlHClb2twzn5hGN3gtBWjmtX1V9Q+Yt03WfhgSAWYbqgj9MRQzdy4jE91I3StwODRg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2038c2f4-1df5-4069-1845-08dd995be966
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:10:19.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LsYwCzZ+H1kiT9GNK4E+p9u7EgyQ4oEmB0Rb0o6+rTlsqvjZrsnMmqFFZay/dBPwo3tX5ZL2UNxDkTh+exHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4438
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220183
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX6Jliv8wonK1t +Apa3hKZVlKLrKUnY7BvdDtmT9MgwpPx/53dNbqzTc8LPXDeWarxZaWcZL0JfYtEFxlgGpp7u/G yApRHKX/H8lYTDXkHFYRWX2EoZwQyT3Rq8KwB9lpgA1g0NvW7bnhCmK2okY1A4fhWNMTD98ylWd
 aNo31p1MmbtLyQ2bQ+E3vJ0W3Gf6lTL7NUjqjj1xJIikC0PGIKWJonofECYedSDD8p4VvXzWHXP tAZnPRBbhGRLBgBdI3n06ou6PJhiXodQYCHpubllrosD7hX9P51p6VyreIX0ElqJcponSRTUdg/ BcjmIH/Dc3Btxh2NvywXwUoQyFeUH+mKqdKJez3cSZVmOlzXSueCLXJ31bNJWD3q0/8Dp2x73hA
 14XAjrmUVz6G234M8syPxpfnCkt+Fya2xDgrynkZO3WseuviG+ujcb9ZqTaxyvt73VuZHlQI
X-Proofpoint-GUID: p-ZwPSUFHSsvkKXpBaMxLdkpaBLU8ZVo
X-Authority-Analysis: v=2.4 cv=b8iy4sGx c=1 sm=1 tr=0 ts=682f6890 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JSvlEa1N7BHlTSyiVS8A:9
X-Proofpoint-ORIG-GUID: p-ZwPSUFHSsvkKXpBaMxLdkpaBLU8ZVo

From: Eugene Loh <eugene.loh@oracle.com>

Commit 4aec5c9931eb ("dt_pid: pid grabs should be shortlived") made
grabs short-lived.  No test cases show the utility of this patch.
Meanwhile, the patch causes roughly a dozen tests to fail on OL9
when the test suite is started remotely using ssh, closing ttys.  The
problem is that DTrace tries to determine if a process is a "system
daemon."  There is no robust way of doing so.  In particular, the
test suite starts trigger processes as root and in many cases closes
all file descriptors, making such processes hard to distinguish from
system daemons.

As long as the patch causes so many test regressions -- and in the
absence of any demonstration of any benefit -- revert this patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 9abbd474c..e2d4e540d 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1257,8 +1257,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 		return 0;
 
 	/* Grab the process. */
-	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
-					DTRACE_PROC_SHORTLIVED) < 0) {
+	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 		    "failed to grab process %d", (int)pid);
 		return -1;
-- 
2.43.5

