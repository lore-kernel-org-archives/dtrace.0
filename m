Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CD41607A4
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104909; cv=fail; b=g3th9Hh//GnkIyZcmpuU0BB72RCEHxYQWDTxHAYx8MfTF/dKptRjUTiLy+sk7S1aLyFB2BS277gk5eealYWOBw/uo6aXwOm+f3+Zwp0hKNZUXSxtVvP17wXuB7hlUXqhw+XVeITuX3UaaFe9CO6Kq87ZKdVYSRXOD4vDYC3hyAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104909; c=relaxed/simple;
	bh=f2BMj3EXRrqiXihLpr/XbtZMWjeRnFDcZOaZ33CkMjI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=joFm6gW8tn28Z4Q0TymmKaIH4LSzWUh3DeCkwLl6J13YFG8MKBxltfuBXLpAXhY6Ci8kpDzI1NU0I8jDNgm7X29Lr535lf7F8SRT5/pLGoMrxEUVjLkFj6tN3LuFeMqohgl+nwhas2U1o3z6vTWusXvp9fJxnES6OTdEa26eZKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bSeXYrfA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pqIcGtOx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bSeXYrfA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pqIcGtOx"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCNQfY026771
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NDBBk52r33asUwVyqHXC1ggKRl3sVpgtC/8C902XCV8=; b=
	bSeXYrfArw5WQ205xgw56GoOvCh1sFe33I9HzaZ6olnhAzF13xloiUiUF8O/RT3N
	49jJ0maKPKj8WAdp/6WV+jhQbSeVl/+YO4a6biMrPz0yze6134OFTefelxIfgKQD
	VL9ZdWZXHOkXaQ2ISrv74V/4CBE5xWOanHN/TbdL9JM7ngILl7LnO+6SZuSSLM3t
	D9kJjyM6yFCu6dDXxwaqY/YKXkWDRbpAMwH3e0P0rTJdh9rgZbzNRIFdTWkWK33B
	bDnUwE04DgLwfRkt6BytO8edbmV0ThntI1ufXxPkzJfeNeTjGRCInBdSLDLKsVep
	BeqDfMD6gJlHrywKXqnomg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2amhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LDF7ks037661
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t82cb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb8M+ETK7U20VIm6TRWl2PMOm0p4nZNbqSH6rHevGB4ybdG5TEok3JpIKH06/lAdplDgOr2In8xmgmEgQWl8Nq04EBKkhrBA+GNIlEK+SYWbekDymFgf19H6/r94ppmk3TUVC+kxLxgtwlaC9CvCnkMeEBTlWRho8hf3VNnefLbtkPZg0I+HRmCd/7yE06+ZoPj7Sk86mmAGPc3uWaUu4wzN3qy9EfJkx4bdt0P7rMmhZdeUuKzXhIVbCf9tK5/U483WgdP9y+H89u/ZVK7v6BWpEeArod6jRt5EdtRoSmxbmoMaGp/TfzaaZXI8Ky699d2mM8fT1aIoUynw/fFmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDBBk52r33asUwVyqHXC1ggKRl3sVpgtC/8C902XCV8=;
 b=lWc+9rHO9MAQ4GUPIzhPp3RCw64UigwDkSJy2K5spreNMzRMBK68pHylrK374F/2ma8ZXTgFjBwlSB79DK9hQdyzq13KUelAj0h+qvElrlDe1R+bQyuE7s1PhzU0wqKw87krKlIEgAFBe2451t/Ycxj94Ug4xh9Ivhj3MvSWiZlhE+YZX2Dab/1zIUOEO8+PGtSatRV7082liKI1CUkIjzaxFlSEw9r00JnWAEXJ2bwuwvdwvktNKQtVC1semHAR/OnCRSF33EHhsK6xcqXvn9hWb2+9xSJgfIWvfsXZRUFFE5D1lhbIH3TZGg4uTiHA3kZiaOXhsT0LYAtz80zQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDBBk52r33asUwVyqHXC1ggKRl3sVpgtC/8C902XCV8=;
 b=pqIcGtOxFKtveEGfJLOrLLeRyz60sIa5+OEclNv+17f6IFDHiIHXuGlPwdOYavz/AqcVeXRd1nTyH7b5KqF6CNrzXH+rqHkt03LzNDdW7EbnqCOS7rV27Y2BQWTlYYr9sWulXTkhVT7VGUYOlw4z0B+igsnTELHy74KFS+15ocM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA4PR10MB8732.namprd10.prod.outlook.com (2603:10b6:208:565::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 13:35:03 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 13:35:03 +0000
Date: Mon, 21 Jul 2025 09:35:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] test: sdt:task::task_rename takes only 4 args on newer
 kernels
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567227B9AEF147FEDE3E6D84C25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA4PR10MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 757a7b48-7db9-4568-647b-08ddc85b6605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0FCdui9BXULeb4yiXaoHR9vy945pn3P/yd1HlUIPFlTX77RsN6/5UquzVLah?=
 =?us-ascii?Q?T0h2TBiB8GzyPycwMYgyTVU8oit1W1pOnuAt2+YMkwSsanvcMNxe1vLif5DD?=
 =?us-ascii?Q?DisXzdCRJqOnAXbfwchRGrnHyG60T1TdKz2JRhH0372Muy7XhMbXyIE61IGX?=
 =?us-ascii?Q?mgNIzl3OxuoPOgcCragLWDcFEmCKvQv4WNRigOzbYnz66psNVOGMK7Osbtp6?=
 =?us-ascii?Q?YOuihsPacXctqH3/dxdsT1Y3oJlc5OaNtdyQ0ciPw69CFMtNBKsKkkfQP5JY?=
 =?us-ascii?Q?9LftUMt+leRcvGp0+uZu5bZLZ1qUJjuNLqSoMXZBseW/9cyUa8E8LyNCOXNs?=
 =?us-ascii?Q?M7nU/1qLtOLCPuBoVrbWA2bI++jVUCYeK8K1fB0WQD8aCEUgvFnpVd88YrTO?=
 =?us-ascii?Q?+u+WIpw+gQmW82HHT+gfyvNz7/mxxObn5OAHYJRT9WrAIBTJKMk2FbRcqPBj?=
 =?us-ascii?Q?PIRIwMxcvxkle5t3Su4LkwR7hmw5TOxTOEAaGQyy7GWbu0uJqduiMCljAJFd?=
 =?us-ascii?Q?xSwX4z7qxy8jpWsiyi6rY5BnuyDjlyq24cZLKzLK8EXf6J0UW8xtmx89W7bj?=
 =?us-ascii?Q?R7Oh0AvDF7vNwZg+3jBjWoTFM/sbZL60XI4SnbVFkCiz0iRSaL6ade81ffl4?=
 =?us-ascii?Q?968QtOp+ydXh7Gou6xwN6BmIwlcz1dBx38h+j2jrZgGDs622unlfXp3XxKSP?=
 =?us-ascii?Q?zXRWczGE6r4FCwTQ+gK9JPxLbFJdDV4hbtEEeeXD15MVy2pDxB3hC8+7hpka?=
 =?us-ascii?Q?Mrcmlc8RxxMJnhRhwezB2cpJwp3R5l08YmaTDytkF/N4l/4tJZ6cjDAaGl+z?=
 =?us-ascii?Q?HJAZcpvQG/ZGlsB6nYGSI3lZaZ7/9obww6nXupd6EamjIN5DkSQ5ozBjp3Dw?=
 =?us-ascii?Q?+NCXCZbrkbTPLb8svP21J2q7jpctGaeDJfs6ZZFAxjxNMi4PQ2Heo1/87+nL?=
 =?us-ascii?Q?A2FQY0flh2dtshUTbXugc4OT2/7b9JYLWsryjWOMbkpJckUzBNY2Drlre8fa?=
 =?us-ascii?Q?xDvF/rs6Q4tjJeMD5CibQoqjVofqmhiX82ZumjoH0bbgnTqdcmICwGD92FaH?=
 =?us-ascii?Q?X0NZWTNZeEfbWMWwgzsFtP8qc8K8JWtl/N7b0SRNf5vWTyLUSFHc3f+yp+/r?=
 =?us-ascii?Q?5Xgmwc9/SemSVL4F/vZiMM/oL9Rq8BeITY55p1IxApqvRVkGZsg1+Vr0mMiY?=
 =?us-ascii?Q?BBtfDAZPdZUYaJSRdEt5qq7pTruJ44xyf6pdJVqT2VmdE/BNGlX1Tp4Yu5Sv?=
 =?us-ascii?Q?YdBqrcq9nT9M4DhpgNqCN9AQanaOWvCWqi5q5NBrLxnd4V3NL32JBtk7FU7t?=
 =?us-ascii?Q?Zi4yLjY8lOehV+oLT45hnenKUmskDVBG0TgBCBfoibD0TkwsPRucaHzFaPal?=
 =?us-ascii?Q?ESz1lTkBJ0Zgr9ojxZGAdpttvChNhYCreTYS7+uQaXApqVjS9/mmfzfLvPe6?=
 =?us-ascii?Q?yvTZ1RFTLc4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QEwQ54Bnb4H5jBP6NmfmfWEAlgEFm8+G0HcpOkj8eH2MaMUb3ty1YEYXV5wL?=
 =?us-ascii?Q?RZLPPd4yIZU9dp3dkgOek6gUgCuSmK1CPC/E8dQkyMHR3uu6j+RWr6NoaAea?=
 =?us-ascii?Q?brhNNeUXeOQ1YIn64SWAMyFOLAQkFIa3J/eV5thrtINNei1yHCWYvwof65Ol?=
 =?us-ascii?Q?bY9z4y8sAjaWkLsN79/1Gpr50wV1jz6xtP8ejk+oxA74S+0ECirhIo3n1UOI?=
 =?us-ascii?Q?dgI6A9++UDwP0adQ+PVxkweOOyKRVRrYRSlH/5qtY1m4Vt7KaTI45CiqDyws?=
 =?us-ascii?Q?RFkJ99faUfa+ov4t3b7XfWGpmssVLW9ABAtPFpVNrJgzPZej5AlmA6zJiMIM?=
 =?us-ascii?Q?BlUw18EFzMD2h8C0nohBg71GxD5VUWsFDIL3NjZ1ReXd1caax7ZmpuWlpKoL?=
 =?us-ascii?Q?lDlWAS6D0j78KmP28K6ZyOE7YwR820GMO1r4ipemQdishpAy+NQshnk9nm+q?=
 =?us-ascii?Q?VN5N8NVZoNrD6peLlPx2H+WMHoV4hLm3pt12OgewZTWhSbPSYc1nhZhS2Is0?=
 =?us-ascii?Q?EIhQyuEYl6Pw2X5rdSlsOXzIKLCOWVtB5M5I4yBWUgjrT2kz/thIIamqaSal?=
 =?us-ascii?Q?J1CPqBoTayMxKI+4mPc26kPZ4iiqe09fOJo6X+Mc2E7pScPCrCqD38fpy028?=
 =?us-ascii?Q?pxmqF38pIjuX9K02chCJjhl/r6Nk72tnfoYRn9vG4GqsewsQ9mG1xXfKdCD/?=
 =?us-ascii?Q?J1094OAS0LFw1WfsbHVcY9HZQVrSzAMDdSWic6Z9573lrBY90QTMgDqpyNk4?=
 =?us-ascii?Q?cTJuNHSBBVgSP6MfTA16LWhgcfngJ+gM+QnSaQp4LnOKwo3Jwc6Bic0bKSU1?=
 =?us-ascii?Q?W6xY/axSskn+aMN0qyBhtTSi76WDEc1H/+B9FWoHmzIG9wjiEexIbk6aYv+z?=
 =?us-ascii?Q?9h0F40uSlVywXTncBr+hSfImxZDfMycMpTchxTenrR6N9p8eJf6SQIlUVGeJ?=
 =?us-ascii?Q?+p30ottX1BiVz/psfoOaBPimR8BSAI/0CqlmCa4zFZNawDfp5PrS9a2+eB/j?=
 =?us-ascii?Q?cVPMAuT8KqfIJz24Otv40DUAzTVSTShO+auB1vseBvui4xLgqEwYd1OHtMd2?=
 =?us-ascii?Q?75W4qUZzyW2xGkB8qYBqEOkUCtntY46a5bSxUT1vYKg5i+XtuDdWL43PPs21?=
 =?us-ascii?Q?XLRo4R5DRyEv4YmDRr+qkKvoigN6JYpGmFGwGK4UGaWt0PhL6mc6n8PunYra?=
 =?us-ascii?Q?F/zTHw04lyR5mTwFIVthLOdD1jZWPvdBoU3yuINuhP7qxR9rcjzvLZ0E7P2b?=
 =?us-ascii?Q?KB+qaKvca+LqV5f5tQAc1m/I/HTdilwn9L+Q4MawtZIsiZe4/kvy9UfXdimc?=
 =?us-ascii?Q?QnzZvsUYplhhlKp6Lo2TQ3PpUBU5iXIzS44farbWrDwSodZhctITZa1HUmiN?=
 =?us-ascii?Q?8Oish2/HVHluJAQjlLLDcMLvSShf98MaeGA1udTmmmRFmTJfm8L+nU/+I0ph?=
 =?us-ascii?Q?u901fbl9z2bYNw9r9kXlC/GFwYai2+KUxI866N3+yTK2fk4f++XbcvU7/Vvm?=
 =?us-ascii?Q?2STjPFK9tL370JZKfL5i0ZSvWeM6eojUdJwBxg2IpOqzYtv9LOSTbxPZrWkh?=
 =?us-ascii?Q?3X1vBND+Gak82TCh4jv5v2O/D/tRl+gx/mPj96DmO/hPVlMHSnNQK6hxMopG?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hnhG7NBa5yylJMWsehzoTH4BCNZvEYubkxgJ99CMGXy+j5eMaG0U43VJWhjYRadN8Oobdgo9iPmXj4E2C+738nBEDiVmfxdwzBv11uJkYSs6Rwe+1EB9yeEvYQZVN4i6NMPI6vNNAhD01fFmR3XlsbZJTzSKZeVRR1jYEQwZWq+WyeODqIGv3LHhQwYjzcLZDgfpiUzIYVXP5iUla0ZjjdjZr8Dm11ZT03hNyr8QQtCpescTXOmOvBbStSGG81Llh9hZBFCTEH+VuizRdAPA3DYhjIc4SnJnjbunZORwxQdWM18nvutbu1JelJEUoaA/jNL89RIA41Ui9BmcsDgrOg5UrGUTCpUAM8BZTFHex3cXEkweTG/iystuxr0PsnI9Rl4Q5xRPbjM+2USlUsplFZoe/KUFsnXGNUu/P+iQ022xE7gFIR98kdacDoScK2n0UB8AnMSkh6sDKs9gmQ+7400Vkpid/hjpgHZWX5EaOFrym7t63HXI54+2z71QZeJOD4U4pj/WgyzmXeIqcfGUnMZ0ZflqNEGVjxteKFFRGwd8MQPNtFIBShrR2xXi1PImA5bvI0beWbpa8O5KAhxpg9K8t/N5OoQE+2XLEcr9u4I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757a7b48-7db9-4568-647b-08ddc85b6605
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 13:35:03.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BO4KI8IZRZF/tMvqTsZjubEe+pYMKFPqe4KtZX/qFVDET/ZCmbL76o//sLVnbPeAZo/U0fCluqXk/vask+3rk4OKL7Z86NqDzg0k6jnw78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210121
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=687e420b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=FP9mFU4RhH8h5mDa6TUA:9 cc=ntf awl=host:12062
X-Proofpoint-GUID: bRYkGBQzObB5mN3hm5NDYcKMOmaOVSLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyMSBTYWx0ZWRfX74ExepeoVfml
 GpHaqJsNJ+lX50D5NOqZptPavrLKreaonA2fA/txMhlKt7uI8rwtkMYqCb88+SHiwgiYRNU2Neo
 0hl4NBQmAa2PwjoUI4N9fftMOZWAdDuRqnLt8d8YzPQ6S6i7L+Xz+sE3AGPUISENNN/YVPm10+V
 XjDRbxCMtEapOsyNUJHIUZ4ytJKSGH1GMS1LYR4Gntv7WhR+2pzpxKejgQ2PBtGMntIMO8YtPwG
 fAhZ8IOE3nGQRlgBNvKpqAJLmYLDxe36HzFlN5nKOawPNqWZYeRCGBOPxufQCyah9EDNd/FgDsv
 lxxj05TKfqOe7gqmledx5J/Jzy/cnIiEUs30yk7MXA3SvpqgxQIMXmf0fq8IFZfpVpVUGeYDGQv
 4QTVC03gsvM+WNh7gAcv6A0aYHD/hgC5h1wEI7TOFLkRvhYEr7BW2PILQ2wxPrH7vopup1wq
X-Proofpoint-ORIG-GUID: bRYkGBQzObB5mN3hm5NDYcKMOmaOVSLb

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/disasm/tst.vartab-bvar.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
index ce489a24..1ce29611 100755
--- a/test/unittest/disasm/tst.vartab-bvar.sh
+++ b/test/unittest/disasm/tst.vartab-bvar.sh
@@ -32,7 +32,6 @@ sdt:task::task_rename
 	trace(args[0]);
 	trace(args[1]);
 	trace(args[2]);
-	trace(args[3]);
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -60,6 +59,7 @@ sdt:task::task_rename
 	exit(0);
 }
 ' 2>&1 | gawk '
+{ print; }
 BEGIN {
 	rc = 1;
 }
-- 
2.45.2

