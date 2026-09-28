Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C9376466
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618600; cv=fail; b=ujd9XeUNM/1xsriArgJM868XC1x46fgQrBLXUICCb2zQNyT8TP1Op/NUqtwPJJ5C1X+XtTiqLmR8X/WGLpZep5QU7glHTGXdMM1/82oQhHTQxrEdXpl14U1hcpIkY2AsAB7Iscs4Eznc5Md/9SpzPasSTpG/yBlO5zvUXa8K9kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618600; c=relaxed/simple;
	bh=+Snig60izFXTUdARadEw6T+3zpwljwKjnvKKkqgpib8=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=DPVSVT0YuqKbQ7zGBJOsvVjOE0e2h5ujifisIvZTVQWdGmnNFIDA+szk4UGB7r0CU2NmBNcPDUgvkR4j2Xe0NBBi7FLp7BjGZKgO/kN7VsNG9cRyrl9Z8Y0Zll5kvD16Qd22dk9mgqC0Vw+XlzJZsPCwfDQWMqPQEd8ILsFMyBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EqUY7OV6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VftXTCBJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EqUY7OV6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VftXTCBJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDiDja1781551
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=hc3Ul+WL/c6dvOP+WG5rJmhqVBZG8V3MJ3fnJc98Hlo=; b=
	EqUY7OV6aT2MPhaMLuzVZqmSSrzpkylB7vVJ7MthGSespVScB0J5i78QlbFart79
	3fRuhbpHxk+aK1wK7OQuMvTd+WwXmGjXhppJeDgGir/+A4yO4CH70U9/Lgf1b1ED
	VQ9Z0C0M2PIMInZdq3iYAKe7lshzPrrmSmIRLqvFn8yKnPtISyo50eFsGxv9Iojo
	CMV/HgTM8CpIsTJoy/w18MoBquTbclUxK3jivsl4MSVNBWsUQmJ1rMAkdbRSU229
	g6EgNaUQMwQ7bzBQkHNd9PfprIAOTtdegSlBt9k2uUwQBA8l4CNZf9MDxgwYmQ8D
	jIPo8ELJbFNd1hzKfJiA4Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4u2bb55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHZOlt020715
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:16 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gnpjpp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeFhHJ0C8MV6sMdp0yxjQH8DUwYH66G7R0Ya3ELUMj1UJqPkUrRLTRT/SFiaeuolrQZqViFzk7MUjOc0ppqr4G5ws9nKSizbEgwaKnI95ZOdramFrmlKaIZgcE1qOMqMF1pdBTF8JZ+VdBElhdWVHJRu3nWi9ruxGzORbxqFBiYfAKJtUwzYileofYEA/sEjW7KGw8+mVtphgS/c2ay4OyQCbj/7aJthKsz5GYaNGRhU6u42GJWl2XPHiG8prbwPZEsIjA04oV74tQywIuCpc43TbscbwcG+F2qln/J6nKLTN59zksQhBB4CwuK0eGiLtucJKpUSyIEhBqE/EfTskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc3Ul+WL/c6dvOP+WG5rJmhqVBZG8V3MJ3fnJc98Hlo=;
 b=iTFa+XzSWGbXS881DExweEr1hl7gaEC0sXKorUcvzBdLR9bkNbxaprLi02hzyBtI43W3mtdjhbtdY0sdKygNMfVz7Q2yHRMPScqE/IzRSQY2qXWv8mTSJyj8oQYs8MhtCidfvf1aIqEtnfA79xoi0YpV3vlPo6GGmGnGej7lIrMV+zh+qKCTofipPuo+OZRQjJSu4rFAI5ZyLyZIyexccwoORzr/0+XlPb91hFSSZ0e0eRpk0TpO5dDJPXuTuXTlLj2W5vGxc4pcLsePkM9x4S7adu0qWgXACw0LVbinas4W0iR1m4MA6YQiwrO4ix8lJrn7qEQ4XIuVDMkfGVkdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc3Ul+WL/c6dvOP+WG5rJmhqVBZG8V3MJ3fnJc98Hlo=;
 b=VftXTCBJshg0cLY8nQ1SfOaNiZtExOOvK7pVZ20dcrrgI6jdR0rS+UaSN+AowTEcMy4Ov87vy9uaPbwJuakrKsZmPI7PmG3++BXIBE8FDOTtAWNDJFOhLuFShQ75PbDqSDW6dMkl2NKP1dJUhQ6bKk0W0m7QP/IiSU3mr5oBDD8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB997582.namprd10.prod.outlook.com (2603:10b6:806:4b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 18:03:12 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:12 +0000
Date: Mon, 28 Sep 2026 18:01:56 +0000
Message-ID: <f7fbd59eed1fa31f615291fdff3f57fb@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/8] module: add support for user module search paths
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB997582:EE_
X-MS-Office365-Filtering-Correlation-Id: a701bffe-b8cc-41f4-2acb-08df1d8ac246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|5023799004|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	69ovPEeRye5uCjw2QzZue7tR8RoDGX7h3m7tAFS7krsATr+Ukt95DP1BR05SHH5SAqF0nvfregtv5ZWxueHHeaAt1E03S+2g+gCp/1/7Ghs7dD3dvpj34+eWPGFnvFLyOoQCRa1GR8z2UhxI74/yrhXnnb45ucfr/JFjaZTheA7yD3ff1ofWikm9EfRsnYhOscJo+JQAjUCyolhNEJdgn9Naio/3hoKejmwqAjncsW0qY3hfWg0yZTi2it6OssPCWwyTme/5sAJrqFnXCIDf8ZDuPlcTVri0XItNh3TLCN3bfX6cm5dxrn/RV8vI5Tsu5Q/NRGRY8Ax1Lop4vejqjJzj/THjE4gYU+AemLnL5jJrgYV/1l0mVfuilM9eb4mqHs9yP/WNyNOz0GtPP3ke1G+3vn688/l9yhkv+VAI7ppJpvfBJf7bkNYO3mpixxPEapHuuHvgGH/yc414zmu/rn0lYrp1a2u+o2np7MbJrUeoOw+2E+G6iCl4dKafkREj3i/ALfGWTUPBR7NLCrF2RvBFRenET9etwqTRJqK6dHcNAu+dtwPOka6q5CODgeBThxO669ZVkiqN3L0tnnbiYjxvqG9jr9aexbx+i3mvYtw7gSzeEe40TJpOuh7yUKDSbaZSHptGG5SzDQC3LT/KEHKe1EmLiuYkB/fJfFVQOjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(5023799004)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vhWs/5z5kQDCG5rN3gq3zTUFvwVU5DOqP2c0HMX7yoDA5zXxrkEmURtKEwK?=
 =?us-ascii?Q?LgjMn0E7+ZxCx/mCJN/hPu6Exn5QJnnDYUhAO9QPdju5H/CcscdgJAv2vtYl?=
 =?us-ascii?Q?PWRjvqjqC0FjC7bm61H/OVookP5rO4t2PslUQIXxnH1h5gLLf/KgM0aiW4AW?=
 =?us-ascii?Q?fKj3PBPgNTA/dVJC9VIPdP4X8yaCzqmjFtxtBgtig4spOUHQIyhmCfmSurUs?=
 =?us-ascii?Q?IvBFjMJKn1V1iMVAXt1RhRJsSdJZhfcc0h4WVokoJQh3ABeMgVlZ/bPzpgTb?=
 =?us-ascii?Q?uOz2Ql5HiLy4bq8dwNbo/BG0SovRSsb4SPgRhYRRd0CW4BdIzFI7//Ww0NDF?=
 =?us-ascii?Q?/FWNQA11VrKTBL9+CCeiBz2JNmElukGkfRE36HQ1IACPHEjmfTuh8S45NU/l?=
 =?us-ascii?Q?9jib5ZkDZT4JahDHgbkUTyxny1f4A/0HeEt7yaYOUqcSOBOPL31pnTeFXT95?=
 =?us-ascii?Q?JX5ycuxNP46Cd6hnri0E/HyC4MmtA5hs9BUDOAZxZFWVCOn8M84b6dCbLK/b?=
 =?us-ascii?Q?aGVAnMow7W3qc1lMowLNcEBCWZs7mI25Tr80ivcw953w9ervMCFBUDttDpjg?=
 =?us-ascii?Q?0eXvSEY5qTH/dIJQlFbFYZYrd/0AX9hSWEtOINjE4iW5CNZuu14UoxloS9az?=
 =?us-ascii?Q?EhHWeNbajY7gDtiwbt2gP+aoeIoQ7OKYR6XBzmyHZouFZIIAFBV3n5vlvaN+?=
 =?us-ascii?Q?oUDX2GR88WOnKh6AYlQF+xufl69RkoJQExYdt4cpJmUtQkpvOq4s7qRf6TK/?=
 =?us-ascii?Q?Vc3OoP1Cr88Z016q7iZmNG4pnfa5og1nfqJe8vd4tU50kaQ2JDMTTuqDC3N9?=
 =?us-ascii?Q?a0Le/rEM1sejvyWbUrjx3zrlGS3IP7IyqTfUB2BoQLYm9Kqu69JewwrL3Y4S?=
 =?us-ascii?Q?ZXXasQMANx/HoCTyhqoI3QH9hpPYfWXecs2zynUFuYqmEK34dq9A1BGKb07k?=
 =?us-ascii?Q?8br7yKJfgisDapzRK01qAC9zoAdI1rCotNeHZBn1sY1hZ9e9inz51Jf7USGM?=
 =?us-ascii?Q?M4DPIDdBDEzgUtlaZaHHyXvsss8rRWFLkBYNw0hdRmFE1M9WRGGnpDnusOFD?=
 =?us-ascii?Q?o365TaK6TLmYq57XmCODF0P+afe49VXf7m4ZMdZW0oAi5hrMVF49TdtlZTX7?=
 =?us-ascii?Q?CxqRXzY8GvqDnUeYf/XqfQj13UCmk+vVlwv6ShJ/PUI4FBZLzpChYudiOKJy?=
 =?us-ascii?Q?liy9fhHcHSyDO84uyyzuoiBckFlbZ/uocU557Jxx4smijxNeoGHSiHpDlXKT?=
 =?us-ascii?Q?PhXaFYBqrEDybvGxP1QIpEhkgaSbnGsZGZDH8r6CuBKQYIaHsXPxP8+HkLxd?=
 =?us-ascii?Q?X94sTGdrDQ+qbmmVM4HyVRXWcxSNMFdtjyS3V5Xn1gngpTU2qpZ7yhqgmTnT?=
 =?us-ascii?Q?EXI0NC4mF0fSJ8RbfNI3s/nV/1y1NSiuLKOWHYT/HHACSVtujxoFKlgxQ7lA?=
 =?us-ascii?Q?AdyVPuHN/T9kgtRcihgvBtxI6M15kSmZa3bTf9bBJYG5F670VLhh/2DNFj5G?=
 =?us-ascii?Q?1Z0jpHGdij1XlJflJyAJnI4o3CFnWW84KiIqKg73SFV2YA1rf/gXeUWXNXpN?=
 =?us-ascii?Q?gbMkizBX+saefHy9L9O5Q1JvdBSjOEuYYNPx2OqIAHlwegnflAnbJWEzUVMp?=
 =?us-ascii?Q?Eq2I261pH8XndUK1vjQixExaVsAfWT/3ltFOHGiZRIvmjSSR/Cn4DA/6LjWU?=
 =?us-ascii?Q?aA6iHgHIWCFpE0r8FFeWiaya99Q+ebWTadmCuNvH8zWf/CUg+qSJEaYlrlhM?=
 =?us-ascii?Q?Lk/m/x8wB4eEJZ+iJG6KIKxxICVDgCE=3D?=
X-Exchange-RoutingPolicyChecked:
	dtZX8+LtkRKV7+9BuCc74MJwm3wXAoSTdJpKiNV57NX4xgtvLXHKfQ1kRMpHXVL2C/Atn+34qhYUNY0e2ASnb2O0JFLTT16Oyj5RkjV4bIE8YNGd3KE2anH5zP3mNBrgpvSt0TRpVQPYCSmkp1EbfPoNAnncCV9hoTROTmZwrSgyYC903IzCm3RZaqfzRcKGdly4Z2uaPQlN3R9kXLvfFs1B6z4s5WVeUI1u4OtQeT5bKPFaUBBqRdhWx1cFQeCUR3rzhvRyCWiFgufPoSyDGNYSB35FJ0pOVn8AMg1MhZSuKkGsyAb4n0pJ23suPpuKC9CwuPKNzFh1MApGvAZB0A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kf8zfvmuZEny2iBdfbTKlNUwxMuJAYoF/p+i0kbKdz1KAg3C+So9C5isJBA3CFXUzvPrmsM7H4507/Rp/eC+KGRBcOJjJSBTT0ziRvW6WOqPWGfamoOl2hGMdASekCVhntJeqz8YDWXwc+c/kR7bag9mjKcOT7bHIiQDufRP7UdSYro0mVCtQpRGR55tWOqa2ORuVjrEsD5LVev7CcLwENQvWIuI09sy+/R9rXkM9LrUXornJnguRX+7tzWntDooT4tep2/4pKJFnAl/YWlN5ZdadYG4y1fwfqJNzcISdsVrAk0rsYDOEN+1FopeMgDzk8xEsBZJJKQg2jSXka4eZizLkIOtYhFOhY2qP3TSEZ8HF6R51TpaW20b6rX/VYA3TwqMTR4TJC32dZplwfP3HuE/q0qs53GU2pkoL3Klp/zZyt2AJzxT/wXbaFsMvhHcJipnmkyMVURIp46fAGdLEOE+xzjfStDsk5EBL+mUMNzP/Ih82tyM6oOt6qWLapouV9ldzFk3cQ2je72ysXSxl7NC9dVkF2IPy5U94fjOdoPYcQNvfqiqrpVq7rClSg+o+WaV7TLGTu5JiZ1GOaj9cebkcv54lfElGevW5bpYRrU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a701bffe-b8cc-41f4-2acb-08df1d8ac246
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:11.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWbuAMmPADO4TFKOQ5JtxPgDrN/m2rtw2eEA5iPxWK5rOnrMkt//WEhBafUtACPBep+dy33CnmOeSoNRVO9CgNGs9dgOLXUmy4aPwo81uXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609280070
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX18fXR8omkrZy
 sTdgM/N9IKcwm2MyUXPI1pHFjW8DQb3PBEcF7rTjPzbcvLUZlq3ngsMMJjHPJrvZO7IP4B1Ui1b
 AabuJCATksttCM0MsdPDiWeDECoXgc10KJyeVuA98+MPp06isge9
X-Authority-Analysis: v=2.4 cv=W9itxhWk c=1 sm=1 tr=0 ts=6abaabe4 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=XFSLjXfZii48tF3rS-oA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532
X-Proofpoint-GUID: yWZHFcpT8qj_6Lgux4P7Jl1e-2lmRgAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfXx1Xk6sWCvMLa
 K+OpPrEK3kS/EnSwG/tNGp3QjSbtrisH4xgAEsrX2sh4egwfZDJJQTDY2ECCCivF05RBR7+f86B
 2O7Vr8HuRZNzH2WNOotdGkuVFUriGy/+DEFJudT6ols2mMl20c+jpmoetBW5kuPVY9nhIiDK4r1
 njcBVZvCWe1AA0bTastjNULMGX0b9UhkF/wS9CaYMNODk/B2KuZgHo+cHwFmJLEZOGt5IBXB0ZS
 ovr0Dkzd7tZYKhSQ48PhOslmXNsvGKNnPrNrcs0fvYBc8xhaA/onVvlEZlIOdzOWx4ILBA0W3Zj
 T0gmUcJISTo4ldBP/cSfvkRd5Ix6BkXromWrXmRKjVoKP2561GGJqKKZwhj9BaRU0pqki/kC/k+
 eKvPKCwPmXfnbYvWaz6nKXOItFCPEHBjEy8ei3ekxmIEWubB9HLtChVUOjXI7qYoR9Aegatbgit
 kJZ4NrX2hpQi/DgNtrWiO4JbcNnt/WzrM/tdHo0A=
X-Proofpoint-ORIG-GUID: yWZHFcpT8qj_6Lgux4P7Jl1e-2lmRgAQ

User modules can be uerspace libraries or executables.

Introducing this support requires a renaming of the previous dt_lib_path
to dt_dlib_path.

We also introduce a dt_module_sym_iter() function to iterate over all
symbols in a particular module.  This can be used in the future to add
function name globbing support to the probe specification for uprobe probes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cc.c      |   4 +-
 libdtrace/dt_dlibs.c   |   2 +-
 libdtrace/dt_impl.h    |   3 +-
 libdtrace/dt_link.c    |   2 +-
 libdtrace/dt_module.c  | 280 +++++++++++++++++++++++++++++++++++++++--
 libdtrace/dt_module.h  |   3 +
 libdtrace/dt_open.c    |   6 +-
 libdtrace/dt_options.c |   4 +-
 8 files changed, 288 insertions(+), 16 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 5860e59d..b49ecb0e 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -620,7 +620,7 @@ dt_compile(dtrace_hdl_t *dtp, int context, dtrace_probespec_t pspec, void *arg,
 		return NULL;
 	}
 
-	if (dt_list_next(&dtp->dt_lib_path) != NULL && dt_load_libs(dtp) != 0)
+	if (dt_list_next(&dtp->dt_dlib_path) != NULL && dt_load_libs(dtp) != 0)
 		return NULL; /* errno is set for us */
 
 	ctf_discard(dtp->dt_cdefs->dm_ctfp);
@@ -803,7 +803,7 @@ dt_construct(dtrace_hdl_t *dtp, dt_probe_t *prp, uint_t cflags, dt_ident_t *idp)
 		return NULL;
 	}
 
-	if (dt_list_next(&dtp->dt_lib_path) != NULL && dt_load_libs(dtp) != 0)
+	if (dt_list_next(&dtp->dt_dlib_path) != NULL && dt_load_libs(dtp) != 0)
 		return NULL;
 
 	ctf_discard(dtp->dt_cdefs->dm_ctfp);
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 161e2106..176291f1 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -1232,7 +1232,7 @@ dt_load_libs(dtrace_hdl_t *dtp)
 
 	dtp->dt_cflags |= DTRACE_C_NOLIBS;
 
-	for (dirp = dt_list_next(&dtp->dt_lib_path); dirp != NULL;
+	for (dirp = dt_list_next(&dtp->dt_dlib_path); dirp != NULL;
 	     dirp = dt_list_next(dirp)) {
 		char *kdir_path;
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 9597f823..22733e33 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -361,7 +361,8 @@ struct dtrace_hdl {
 	int dt_cpp_argc;	/* count of initialized cpp(1) arguments */
 	int dt_cpp_args;	/* size of dt_cpp_argv[] array */
 	char *dt_ld_path;	/* pathname of ld(1) to invoke if needed */
-	dt_list_t dt_lib_path;	/* linked-list forming library search path */
+	dt_list_t dt_dlib_path;	/* D library search path (list) */
+	dt_list_t dt_user_path;	/* userspace module search path (list) */
 	char *dt_module_path;	/* pathname of kernel module root */
 	dt_version_t dt_kernver;/* kernel version, used in the libpath */
 	char *dt_dofstash_path;	/* Path to the DOF stash.  */
diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index aa5eb735..3d17c07c 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -513,7 +513,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		    "failed to write %s: %s", file, strerror(errno));
 
 	if (!dtp->dt_lazyload) {
-		dt_dirpath_t *libdir = dt_list_next(&dtp->dt_lib_path);
+		dt_dirpath_t *libdir = dt_list_next(&dtp->dt_dlib_path);
 		const char *fmt = "%s%s -o %s -r --version-script=%s /dev/fd/%d %s";
 		const char *emu = "";
 
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 1b16d2cd..acf4baa7 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -45,6 +45,171 @@ dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp);
 static void
 dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp);
 
+typedef struct dt_path {
+	dt_list_t		list;
+	struct dt_hentry	he;
+	const char		*str;
+} dt_path_t;
+
+static uint32_t
+dt_path_hval(const dt_path_t *path)
+{
+	return str2hval(path->str, 0);
+}
+
+static int
+dt_path_cmp(const dt_path_t *p, const dt_path_t *q)
+{
+	return strcmp(p->str, q->str);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(dt_path, dt_path_t, he)
+DEFINE_HTAB_STD_OPS(dt_path)
+
+static int
+dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
+{
+	dt_path_t	tmpl, *path;
+
+	tmpl.str = s;
+	if (dt_htab_lookup(h, &tmpl) != NULL) {
+		free(s);
+		return 0;
+	}
+
+	path = malloc(sizeof(dt_path_t));
+	if (path == NULL)
+		goto fail;
+
+	memset(path, 0, sizeof(dt_path_t));
+	path->str = s;
+	if (dt_htab_insert(h, path) != 0) {
+		free(path);
+		goto fail;
+	}
+
+	dt_list_append(&dtp->dt_user_path, path);
+
+	return 0;
+
+fail:
+	free(s);
+	return -1;
+}
+
+static int
+dt_user_path_add_env(dtrace_hdl_t *dtp, dt_htab_t *h, const char *env)
+{
+	char	*str, *end;
+
+	str = getenv(env);
+	if (str == NULL)
+		return 0;
+
+	for (;;) {
+		end = strchr(str, ':');
+		if (end == NULL) {
+			if (*str == '\0')
+				if (dt_user_path_add(dtp, h, strdup(".")) == -1)
+					return -1;
+
+			if (dt_user_path_add(dtp, h, strdup(str)) == -1)
+				return -1;
+
+			break;
+		}
+
+		if (end == str) {
+			if (dt_user_path_add(dtp, h, strdup(".")) == -1)
+				return -1;
+		} else
+			if (dt_user_path_add(dtp, h, strndup(str, end - str)) == -1)
+				return -1;
+
+		str = end + 1;
+	}
+
+	return 0;
+}
+
+static int
+dt_user_path_init(dtrace_hdl_t *dtp)
+{
+	dt_htab_t	*h = dt_htab_create(&dt_path_htab_ops);
+	FILE		*fp;
+	char		*buf = NULL;
+	size_t		len = 0;
+	char		*str, *end;
+	int		rc = 0;
+
+	/* Add paths from $LD_LIBRARY_PATH. */
+	if (dt_user_path_add_env(dtp, h, "LD_LIBRARY_PATH") != 0)
+		goto fail;
+
+	/* Add paths from ld.so.cache (using ldconfig -p output). */
+	fp = popen("/sbin/ldconfig -p", "r");
+	if (fp == NULL)
+		goto fail;
+
+	while (getline(&buf, &len, fp) != -1) {
+		/* We are interested in lines like: <something> => /path */
+		str = strstr(buf, "=>");
+		if (str == NULL)
+			continue;
+
+		str += 2;
+		while (isspace(*str))
+			str++;
+
+		end = str + strcspn(str, "\n");
+		while (end > str && isspace(end[-1]))
+			end--;
+		*end = '\0';
+
+		end = strrchr(str, '/');
+		if (end == NULL)
+			continue;
+
+		if (dt_user_path_add(dtp, h, strndup(str, end == str ? 1 : end - str)) == -1) {
+			rc = -1;
+			break;
+		}
+	}
+
+	free(buf);
+	pclose(fp);
+
+	if (rc == -1)
+		goto fail;
+
+	/* Add paths from $PATH. */
+	if (dt_user_path_add_env(dtp, h, "PATH") != 0)
+		goto fail;
+
+	/* Always add . in case it wasn't added yet. */
+	if (dt_user_path_add(dtp, h, strdup(".")) == -1)
+		goto fail;
+
+	dt_htab_destroy(h);
+	return 0;
+
+fail:
+	dt_htab_destroy(h);
+	return -1;
+}
+
+void
+dt_user_path_destroy(dtrace_hdl_t *dtp)
+{
+	dt_path_t	*path;
+
+	while ((path = dt_list_next(&dtp->dt_user_path)) != NULL) {
+		dt_list_delete(&dtp->dt_user_path, path);
+		free((char *)path->str);
+		free(path);
+	}
+}
+
 static uint32_t
 dt_module_hval(const dt_module_t *mod)
 {
@@ -166,6 +331,75 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 	return dmp;
 }
 
+/*
+ * Create a userspace module for an ELF object.  Userspace module names are
+ * resolved based on the LD_LIBRARY_PATH, ld.so.cache entries, and PATH.
+ * Module loading is lazy, as it is for all other modules.
+ */
+dt_module_t *
+dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
+{
+	dt_module_t	*dmp;
+	char		*file = NULL;
+
+	if (name == NULL || name[0] == '\0') {
+		dt_set_errno(dtp, EINVAL);
+		return NULL;
+	}
+
+	if (dt_list_empty(&dtp->dt_user_path))
+		dt_user_path_init(dtp);
+	if (!dt_list_empty(&dtp->dt_user_path)) {
+		dt_path_t	*path;
+
+		for (path = dt_list_next(&dtp->dt_user_path); path != NULL;
+		     path = dt_list_next(path)) {
+			if (asprintf(&file, "%s/%s", path->str, name) == -1) {
+				dt_set_errno(dtp, ENOMEM);
+				return NULL;
+			}
+			if (access(file, R_OK) == 0)
+				break;
+
+			free(file);
+			file = NULL;
+		}
+
+		if (file == NULL) {
+			dt_set_errno(dtp, ENOENT);
+			return NULL;
+		}
+	}
+
+	if (strlen(name) >= DTRACE_MODNAMELEN ||
+	    strlen(file) >= sizeof(dmp->dm_file)) {
+		dt_set_errno(dtp, ENAMETOOLONG);
+		goto fail;
+	}
+
+	dmp = dt_module_lookup_by_name(dtp, name);
+	if (dmp != NULL) {
+		/* Do not turn a kernel or built-in type module into a user module. */
+		if (dmp->dm_flags & DT_DM_KERNEL || dmp == dtp->dt_cdefs ||
+		    dmp == dtp->dt_ddefs ||
+		    (dmp->dm_file[0] != '\0' && strcmp(dmp->dm_file, file) != 0)) {
+			dt_set_errno(dtp, EEXIST);
+			goto fail;
+		}
+	} else if ((dmp = dt_module_create(dtp, name)) == NULL) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		goto fail;
+	}
+
+	strlcpy(dmp->dm_file, file, sizeof(dmp->dm_file));
+	free(file);
+	return dmp;
+
+fail:
+	free(file);
+	return NULL;
+}
+
 dt_module_t *
 dt_module_lookup_by_name(dtrace_hdl_t *dtp, const char *name)
 {
@@ -393,15 +627,21 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (dmp->dm_flags & DT_DM_LOADED)
 		return 0; /* module is already loaded */
 
-	/* Load BTF data for the module. */
-	dt_kern_module_find_btf(dtp, dmp);
-
 	/*
-	 * First find out where the module is, and preliminarily load its CTF.
-	 * If this fails, we don't care: the problem will be detected in
-	 * dt_module_init_elf().
+	 * A non-kernel module with a known file was explicitly created as a
+	 * userspace module.  Its CTF, if any, is in that ELF object; do not let
+	 * kernel module discovery reclassify it as an unloaded kernel module.
 	 */
-	dt_kern_module_find_ctf(dtp, dmp);
+	if ((dmp->dm_flags & DT_DM_KERNEL) || dmp->dm_file[0] == '\0') {
+		/* Load BTF data for the kernel module. */
+		dt_kern_module_find_btf(dtp, dmp);
+
+		/*
+		 * Find where the kernel module is and preliminarily load its CTF.
+		 * If this fails, dt_module_init_elf() reports the error below.
+		 */
+		dt_kern_module_find_ctf(dtp, dmp);
+	}
 
 	/*
 	 * Modules not found in the CTF archive, including non-kernel modules,
@@ -2064,6 +2304,32 @@ out:
 	return 0;
 }
 
+int
+dt_module_sym_iter(const dt_module_t *dmp, proc_sym_f *func, void *arg)
+{
+	GElf_Sym	sym;
+	uint_t		i;
+	int		rv = 0;
+
+	for (i = 0; i < dmp->dm_aslen; i++) {
+		const char	*name;
+
+		if (dmp->dm_ops == &dt_modops_64)
+			dt_module_symgelf64(
+			    ((const Elf64_Sym **)dmp->dm_asmap)[i], &sym);
+		else
+			dt_module_symgelf32(
+			    ((const Elf32_Sym **)dmp->dm_asmap)[i], &sym);
+
+		name = (const char *)dmp->dm_strtab.cts_data + sym.st_name;
+
+		if ((rv = func(arg, &sym, name)) != 0)
+			break;
+	}
+
+	return rv;
+}
+
 static dtrace_objinfo_t *
 dt_module_info(const dt_module_t *dmp, dtrace_objinfo_t *dto)
 {
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index d22cc802..88b4f1a4 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -15,9 +15,12 @@ extern "C" {
 #endif
 
 extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
+extern dt_module_t *dt_module_create_user(dtrace_hdl_t *, const char *);
+extern void dt_user_path_destroy(dtrace_hdl_t *);
 
 extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
 extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
+extern int dt_module_sym_iter(const dt_module_t *, proc_sym_f *, void *);
 
 extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
 extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index ef6b7599..b5d2b648 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1348,12 +1348,14 @@ dtrace_close(dtrace_hdl_t *dtp)
 	for (i = 1; i < dtp->dt_cpp_argc; i++)
 		free(dtp->dt_cpp_argv[i]);
 
-	while ((dirp = dt_list_next(&dtp->dt_lib_path)) != NULL) {
-		dt_list_delete(&dtp->dt_lib_path, dirp);
+	while ((dirp = dt_list_next(&dtp->dt_dlib_path)) != NULL) {
+		dt_list_delete(&dtp->dt_dlib_path, dirp);
 		free(dirp->dir_path);
 		free(dirp);
 	}
 
+	dt_user_path_destroy(dtp);
+
 	free(dtp->dt_cpp_argv);
 	free(dtp->dt_cpp_path);
 	free(dtp->dt_ld_path);
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 0a35e852..4706589b 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -359,7 +359,7 @@ dt_opt_libdir(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 		return dt_set_errno(dtp, EDT_NOMEM);
 	}
 
-	dt_list_append(&dtp->dt_lib_path, dp);
+	dt_list_append(&dtp->dt_dlib_path, dp);
 	return 0;
 }
 
@@ -541,7 +541,7 @@ dt_opt_stdc(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 static int
 dt_opt_syslibdir(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
-	dt_dirpath_t *dp = dt_list_next(&dtp->dt_lib_path);
+	dt_dirpath_t *dp = dt_list_next(&dtp->dt_dlib_path);
 	char *path;
 
 	if (arg == NULL)
-- 
2.52.0

