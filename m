Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407B13A265
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247476; cv=fail; b=nKMoxu5pl32WCBEML0Ks+jJfco/HX72efWjSn129KfdpkJ0Xergyp44GPoLUeNit0de/+JbcCF/nuZK8Unk9S/i+pMhL/sHuQpACqRSod4oaAOhFzWyLseszEJ4KbR/reenoXA7IpvA7em1frs86qComOvjSGqNSlpFg0ImggcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247476; c=relaxed/simple;
	bh=RIYezx7iyKCWnqY/R7DOK/kB4JVspT/lkKyaYvAAfXw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=BpDilhGQPuDzE/Py+J68BTvuxN7b3mLIJtJaXQ4Lo6ykv3+nAdPblLKKMmNyMAlBSg8qNhlrhZca6lKU1F3A82iWmXDehhUDAEmoxT2GB9Z1aMEq6IW+2sNS3KqdGeh/fvQtvd4jEOdbciPtOVyxyYVo8Ji5NnyaYnAVlS8asW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m6SWkvL1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DE4bSekx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m6SWkvL1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DE4bSekx"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMQjxK032595
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 05:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xqnW7JwPPE2wMDM6ikBXkOfMB79/+Lj4vdp5SzozsyM=; b=
	m6SWkvL1E8gXZb2mVLoZxyVMmhb4XvjDGUovnufjkKKydgGvHWWclmhurRObluAC
	FkVJPvwm7oMD21RI5wK8BSyFXdITUHG5TDUHsYMMWrzKD/oz/gzPih/nyJxidbIO
	M8J8uVb/MT6wW6IpCWCunBqWI/wPAIR3Q0RzbqjGuSqeDh4Cmlc7pbFb9N7f/niE
	8S+QEq3PNc15d6ptse+h9p+wtsaJP3jt6ju4+oMEU3yHrcxzdubN7GqTg7RhbfHP
	JOUZJVdPDbGNsZrRUK74AyQoEyG6H9oSz2cvjxkIOJ9v/AsyNCJt/djcMGguxjEs
	75KpfQrOgx5lRYzx0tUruA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx6tde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 05:11:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56N2DQ9H037670
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 05:11:11 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801ta5wg9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 05:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx3ww86ZDu++7c6Th9cv1OsxberI4RK6KruOaKSOCMqLIszi9jWAXu96bb0DXa1uxBhpD6aggyoAQvsexjuylSjVNQ/TyXAdB6N968pRYaKl6essDR80cSdHK4IZsrAH+gEK7tpGz5LtUPwyRPIMRVq936VJ19xKnSxIoAx8VhrWNBotWOiPKA0xk/3N4bgIx9FE/Z19rE0DKfQF74uvLPrdWDXIVBEEoeGfOy0ZSYAV9UEVvZ9LfVBpaqUrlPjdPpUwBl9gWWn/5GmBUm9mqgsJyiJfjYME3sh9Nl3o4Yer/PAXOHPwgJ/j8jNF6c7+JwbdeN3PFXJHV2kV4Y13iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqnW7JwPPE2wMDM6ikBXkOfMB79/+Lj4vdp5SzozsyM=;
 b=aEOo85C00m1yFQn4CjLIDF7CWA6Nhj/Fl3BbjT02xgIgMOIkPi+My3C+tACDnUdMRLngxtHQ8YLFEOsjxp5ErxZeB6S3xnfDWb46s1aC8L2s6+ks+jPa4rIbzZ7Naza2LoT+798u+gXJ1pKXYGYdb2l/CaC+BJeGDP+jfbdluVH3kkvd9UTEtN7ibjv7qWmm4F6uhPaH8FSt6aG754Nngo/0xnUa9clu0l3ls1olUjFAzr9E1EA3aDOMQYjxEUgJ9AK801GulA+QGjw8tvT7Wjq8a/E+PBPTWKLsIuKLi84msAwwID2K4L9as9NTlxRD+li2JgIlIfxcffdChPwLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqnW7JwPPE2wMDM6ikBXkOfMB79/+Lj4vdp5SzozsyM=;
 b=DE4bSekxlFZCUqwLkaJKQGTMrRrqzFim0R2RCPfScfDRqWZL+iy8R+wEQwgvL0oP+tnv+l4Pzzv2K/jzDIS7ru0YXI/CZ39gPA4u9BOf40J/mpZwndPRhOYBcEo9s8EJ6naRqNemnR+YVxO9FI2lzZIun5xx2dN26vQ9ekndhtA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7478.namprd10.prod.outlook.com (2603:10b6:8:166::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 05:11:09 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Wed, 23 Jul 2025
 05:11:08 +0000
Date: Wed, 23 Jul 2025 01:11:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] lexer: support // comments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56723B89F0E03BCEB06A3FFEC25FA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b250af7-00eb-4bf3-76df-08ddc9a75522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q3X8NFhAgoQUIteGwOpJmwVi7CyGyCLZordyrug3cTvgLfX23fIlU5XcTCPm?=
 =?us-ascii?Q?ex2jJF99I0Lv5IVVLd/Tufa34tfcGZxKjejNY94IxkurOqbK/amWBfEXPogc?=
 =?us-ascii?Q?bjX/e8ONXqYkXxezm62eguuqFTvwE6lWeJJNc8hQAtMmF1mBt7O4ySYefPc4?=
 =?us-ascii?Q?dIsSqzU3s9olsKxtLxNJOl1B4p6aWqIUn6w1ZFnm3QREYcYGlsM5kK42e15L?=
 =?us-ascii?Q?KW8h72bZbCXcKG5E6Lyxq9Ss7ZVy/NugCKGwTN9nq4sOZoScJC0HDGLiAU0D?=
 =?us-ascii?Q?+gJY90odkLHFGnx+LoHxwLURQZjZA/Zf2OHIcCpDBeQCVIw0KvpzskRLVL7i?=
 =?us-ascii?Q?3SmG+BRvfbe0EzrdPmzOd8gploL1R+2EqKpRDZ0D5K6DzBGJPboViiKgsZRm?=
 =?us-ascii?Q?7DqAibJzWTdAFPWMLsf395Hcdol63M1m0GqFFW2JtKzFKYhezGsS3YnPecLe?=
 =?us-ascii?Q?zc2AfbljU8DYY0vGYUtJNP0EFbTEOLZey8BPTO1mrlo2AcxamaoEEMG1tFvK?=
 =?us-ascii?Q?K888qqRqyeBm1oB6J1FmRQTZTtPLeOH1y7TBhW16OPjnJ3Ub4+5B4peEE9Ei?=
 =?us-ascii?Q?ixqh9evg9LOviImfj5/ZcN+EeFJtAwYcyY2KfrCYLmn9IiJBb2wZM2J1wPeP?=
 =?us-ascii?Q?0srZsghJVzOIEtbNZ8uVtAjXRp54ZRDSwRNOCwQHfItt+YNzuyedrpuQt+ZA?=
 =?us-ascii?Q?myexekfRKSDPPNs/QblWPnSC/P3GFxyuiw8NwLCNVydEFPORlBHL6fQurvRx?=
 =?us-ascii?Q?K4qpK8+rgG16py+skcvT3vXkmhuQDA1wCJr1eU9hCg/R2QU1rIqYVslAZwU0?=
 =?us-ascii?Q?hMv+s8y3Dg6BZXv3W6b/LQvdDTEYYa9scSlLf9PumYtNk7NzWQ8r5kIVsN0J?=
 =?us-ascii?Q?riQB7zDv9HsJQzAYy1wrtjuVr2+fDgEm847iNVivOYsgJYCHeLvQnQT4W8a5?=
 =?us-ascii?Q?D0/1FtRPW0lqrLnH7lmMUYWkZbOFyuz/VrO+WCv6XMdS9UO3/ve2QHSGNYbB?=
 =?us-ascii?Q?HWJ9a0ddFrhmL3YTpp8tgeYe1LycrVeF1ovdqf+e3PhQn2iCHDhUZkC3rXY1?=
 =?us-ascii?Q?5jzsBV+ID8u6AzwTLovcYk1FF3K7tNODH3YIQNIoc4hEhiVT+fHg0NPfxCca?=
 =?us-ascii?Q?e1LgdzFISlvC7aNbLNaSZCvpLlh7udcyPY7FxekkXN2PIhxGTER6euZSaFMH?=
 =?us-ascii?Q?JTZjxXsOKEQBSNqtpXPYEs0RWdg9nZcGMFcFS/UwWOqbaj6JKvUGJ4uaP/hx?=
 =?us-ascii?Q?IUaIbxJGjTrKnkhI1fsQR4+3sum6VHiZIhgil5DF8WSrA3w/7vul5x/SGB77?=
 =?us-ascii?Q?iYOrK13+P1Ew5wEo9+JVsf+G+ZDgKZ8C/7vsESyBbFd5gWVM215CH17mbeFk?=
 =?us-ascii?Q?BTIz8q+q7f6Gg09SGKQDQnRn3A7dkmkAK3tbcHBuZEecwVkfzFW/kI6qaO7D?=
 =?us-ascii?Q?fYNCbAsOOeU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJ/lS4OQ391kHpIykBbUM3mwS0jctLIC45a/owiHRuWArN4ahgD/g9JUi7ml?=
 =?us-ascii?Q?qVb6hu+NkhWZ9KfnV8HI8kpsBkBcKHQxDPjCQUtdhRIwhI4o0tMq6UtTLbWL?=
 =?us-ascii?Q?qk0SnQxub/kTbWOnsUbnk6q6Tny9be3dMoapi91zpeksKUb6EmXdvWxI0hXn?=
 =?us-ascii?Q?02lvLCBmJwNb5oscqiyu5bgIWK1eGN24dbbJmCS5HQjXCml4LNolBceflcKs?=
 =?us-ascii?Q?UTZCvJ6a0S1tSQBICcdMsl2LkZjPPAhcFWTUyB77bunf6ShMhduep7hgEvxh?=
 =?us-ascii?Q?6Qou2HBAqgNXXGPSxnLPdV08DkNhSUTCmnUDYhMi/krwcMEutOg8xybMFduK?=
 =?us-ascii?Q?RKeUFzkCbRqsEyuVAgIzpWFDmbAmNXqR/ayXACd05QF9Z2zdaftpCmAmgsE1?=
 =?us-ascii?Q?8XMZfFOu3m9TCc3ih8+qF4gtqLOP8OuHf7YwT6L7I4mCnNDZZuBYmih/QZBb?=
 =?us-ascii?Q?lqXzgJ9zq7O3mym7EgmXJJ9dx+IaPIRCIWy1DqF2iaVtIqfTHQMdhfzd2NTm?=
 =?us-ascii?Q?+6se6BWJoSJjMTiFa1D4spggkngIXfDKvhFs5SxDNnnMUL/qbyGSdpc+lFKD?=
 =?us-ascii?Q?8kmuWocQPbOrFNF4E6Dxz3FRkb/+IEJF0GKPCn659+8jjx65O4/SED3gZESs?=
 =?us-ascii?Q?Iwmn5EOO/5Xt0CEs3c8ZOYe/Uepe78oAuPGRL+m0A+NX3x35oAfpnoY7uzev?=
 =?us-ascii?Q?prshYl/5YV1WoO629pKEITKnTp5F9uv/eR1e8bCXeXwkFJk6IYwqv4KCLeIM?=
 =?us-ascii?Q?/j9DE4tYqMCvpYGIdHs60afqGIL9J2o9MhX5G/gRRH9Q4piXc5mqbcaF6lJA?=
 =?us-ascii?Q?R2xJnL21PCM3JNFWpB7e2oujuttiWHU/+r+wexjw6rCamKLKsuuE1wK5yJvc?=
 =?us-ascii?Q?+b+X6LOI6ScF8IjHQyxs+jHa9JsCf98LCCuMK+TYx8R2m4lWcxT6bspGramy?=
 =?us-ascii?Q?Cgf8zALj8gkXzcVwoVj13YBDzK/4L90k0dXDPXF8TOan27tPRKe1cbCo1GNd?=
 =?us-ascii?Q?l3Kk2uGDbDdqYqKbaf9M6NHCMYSR9hL/k9AJswDwhmHEyGOGclqkbGIGm3q+?=
 =?us-ascii?Q?wEf6kVg0SmJlC3syXI3lVtuqghzjSXzvCpJj9K9+d5AjvbE0B9KfmULAoWH5?=
 =?us-ascii?Q?zFGhiT9d3Ayx5WJhbTFMzzcT4h14UXnLF3CF/CZ0W/WUjYm3dRPN5v3Eiasv?=
 =?us-ascii?Q?wTIr4fmsJ3ZYtUpL7kHA4xoyCw8l1gkMBWeEvhKRyu7KrwlEfWsNgsZUctFf?=
 =?us-ascii?Q?bhNnFIGZg+vSe5sX/8Us2P5o+g0v8Kz2qUMbyIc0FntuN1AbFUp467F2NrZ6?=
 =?us-ascii?Q?FpPRMw5WKVRdL42cy6WscouueW+hJovTsHX/KitmrOK617DqfM3OUke30kwZ?=
 =?us-ascii?Q?8IIWwj+6M8yM8umXVAdxCRxc0Yw0cyVYGq5Tp/u1iXeRC6VCJKxrdrN3PNT3?=
 =?us-ascii?Q?MEArPAXoopnZvXYGngMTQAzTdeDuYsAFTM9t2RgYxni0MpTBMAvsE8FEKa+r?=
 =?us-ascii?Q?B7NfLyI+Qy40uVixg8gjSvzXtJ5jXLGDdCDcf8p5rrmLm+ZET1zIf/YkqRJB?=
 =?us-ascii?Q?jdYH8pmj+dhkgNuYi3mrKeJWRCvZrCKAIid/qJUEqHhdU5ZOBh2WYPH/bGY7?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+UXHVLE+GZqQkeS5BnUPlT46kgqjbsWliOboTerxMnO2RVPhVdwqrmPGQdHjA1b1gY24171b4Lk01sO8DyVI4yNuRWpG1BujS/ifO2Pzj6T6FIstH4LQkCPu9rZotlKO5+P3Oh8ffw7gEuL+q+ifpz5sQbWVpBbrwLr6pu/gKy0Js5t43pFC+U5HDR1z9LkYkWjoVL9aOshnHpiWf8vXN7T/5xx+mQyfKp2i3VBwY557yyH3Pp3KPhDoN9vvzezbh0RTQxe7IccULxY+peX2ddh9Uc0ts00QdEpJ9TPJzVniw9Lyj1gA6CNNlr15GEQvEUBpKpF8AFKwJ36ol10usqioe5ufHgkWhaCG7BMggXUd2VvCG/9Mjy7Hnb9z5SnQLUYSRAewbINdlzTdAt4aj9uCfYgQQbSnoAXpP7pxUzqWZSwA6juGjJbjvo4VgQ6vbtd/fuUT20OZX6nfGpBtKUzxwMGLmg+yzeSJcwHr+IEx/jQv6cfDI33FIwtYlsRiJvgc/zPuqlgz9Srxurx96ZGxltMdv160nfpSmaD3Xa82uWP1C2QW6SkPAGQEa9XJ/i2en/GbyQxS+gFHy6Bt1bZbJRWoYoMhJXxZahlYCuE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b250af7-00eb-4bf3-76df-08ddc9a75522
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:11:08.2728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxXjElX35Zcd1cCMuat2YZOnLE9J48h/YUT2biWkp7wS1ZVBrzhs68QezWoIFTmRXaReMlpLYhmd9OnadDefyEApHkiXHk8uR4PWkFv8XCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7478
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0MSBTYWx0ZWRfX6+RySPi2YrgC
 fUIj0uBnffuw52SHxxGYf/MRAH1WmYrnOvlIV785WTJCI0odVaEU4yeC7uAD9rYoOMmh4BTBfUQ
 VRXi7gTjdjzfSbeEMRESAzvWjLhNzagRaAS9FbpponsoHpG0sJ4JmT1f9tVIoi55eaayVD4io5e
 nVBVjJZZPtZOo60UhAGBTKomUKOZbEtdS/+97iVCh9VDzn/Sgq63CgkyaXOQ/BtUhDXNmy9z9d7
 1hZX3MrRKG/pOdsIYj2DlFBFXBmKMiPTD2xLf9YBrop5c3dNVqi4pyQhp919iJDOhzR90j2dKnJ
 9B7lQ4zcuevpclNYEchtjCiF2OGfK5TUMS5QRPARju3djybtYh8J1nwfUSQp9nJr6Kt4Sx5V0ge
 PDtD2m4bjF1vwAPlCc1HS4czUKLCsN2vGEHnfihtiBA7oyRfLzyx/OMOoymlzIRksiJDMwFT
X-Proofpoint-GUID: O3Kw5dSBP8MRT31vfyYu8oMmbpQmRKKG
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=68806ef0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=9vH8Nw7S0OfLnnEk_gcA:9 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: O3Kw5dSBP8MRT31vfyYu8oMmbpQmRKKG

Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_lex.l                            | 11 ++++++++++-
 test/unittest/lexer/tst.boc-in-line-comment.d | 16 ++++++++++++++++
 test/unittest/lexer/tst.boc-in-line-comment.r |  5 +++++
 test/unittest/lexer/tst.eoc-in-line-comment.d | 16 ++++++++++++++++
 test/unittest/lexer/tst.eoc-in-line-comment.r |  5 +++++
 test/unittest/lexer/tst.eof-in-line-comment.d | 16 ++++++++++++++++
 test/unittest/lexer/tst.eof-in-line-comment.r |  5 +++++
 test/unittest/lexer/tst.lc-in-line-comment.d  | 16 ++++++++++++++++
 test/unittest/lexer/tst.lc-in-line-comment.r  |  5 +++++
 test/unittest/lexer/tst.line-comment.d        | 16 ++++++++++++++++
 test/unittest/lexer/tst.line-comment.r        |  5 +++++
 11 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.d
 create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.r
 create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.d
 create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.r
 create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.d
 create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.r
 create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.d
 create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.r
 create mode 100644 test/unittest/lexer/tst.line-comment.d
 create mode 100644 test/unittest/lexer/tst.line-comment.r

diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index 9d502912..e8f3bc8c 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -35,6 +35,7 @@ int yydebug;
  * S2 - D program outer scope (probe specifiers and declarations)
  * S3 - D control line parsing (i.e. after ^# is seen but before \n)
  * S4 - D control line scan (locate control directives only and invoke S3)
+ * S5 - D line comments (i.e. skip everything until end of line)
  * SIDENT - identifiers and comments only (after -> and .).  (We switch to
  *          SIDENT only from state S0: changing this would require new code
  *          to track the state to switch back to.)
@@ -46,7 +47,7 @@ int yydebug;
 %n 600		/* maximum states */
 %option yylineno
 
-%s S0 S1 S2 S3 S4 SIDENT
+%s S0 S1 S2 S3 S4 S5 SIDENT
 
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
 RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
@@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
 			BEGIN(S1);
 		}
 
+<S0,S2,SIDENT>"//"	{
+			yypcb->pcb_cstate = (YYSTATE);
+			BEGIN(S5);
+		}
+
 <S0>^{RGX_INTERP} |
 <S2>^{RGX_INTERP} ;	/* discard any #! lines */
 
@@ -548,6 +554,9 @@ if (yypcb->pcb_token != 0) {
 <S1>.|\n	; /* discard */
 <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
 
+<S5>\n		BEGIN(yypcb->pcb_cstate);
+<S5>.		; /* discard */
+
 <S2>{RGX_PSPEC}	{
 			/*
 			 * S2 has an ambiguity because RGX_PSPEC includes '*'
diff --git a/test/unittest/lexer/tst.boc-in-line-comment.d b/test/unittest/lexer/tst.boc-in-line-comment.d
new file mode 100644
index 00000000..61f5961f
--- /dev/null
+++ b/test/unittest/lexer/tst.boc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain begin-of-comment markers.
+ */
+
+// Comment /*
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/tst.boc-in-line-comment.r b/test/unittest/lexer/tst.boc-in-line-comment.r
new file mode 100644
index 00000000..d57f017a
--- /dev/null
+++ b/test/unittest/lexer/tst.boc-in-line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.boc-in-line-comment.d' matched 1 probe
diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.d b/test/unittest/lexer/tst.eoc-in-line-comment.d
new file mode 100644
index 00000000..8fe2ff04
--- /dev/null
+++ b/test/unittest/lexer/tst.eoc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain end-of-comment markers.
+ */
+
+// Comment */
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.r b/test/unittest/lexer/tst.eoc-in-line-comment.r
new file mode 100644
index 00000000..884cd554
--- /dev/null
+++ b/test/unittest/lexer/tst.eoc-in-line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.eoc-in-line-comment.d' matched 1 probe
diff --git a/test/unittest/lexer/tst.eof-in-line-comment.d b/test/unittest/lexer/tst.eof-in-line-comment.d
new file mode 100644
index 00000000..a9207693
--- /dev/null
+++ b/test/unittest/lexer/tst.eof-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: End-of-file in a line comment is an error.
+ */
+
+BEGIN
+{
+	exit(0);
+}
+// Comment
\ No newline at end of file
diff --git a/test/unittest/lexer/tst.eof-in-line-comment.r b/test/unittest/lexer/tst.eof-in-line-comment.r
new file mode 100644
index 00000000..fdf259e0
--- /dev/null
+++ b/test/unittest/lexer/tst.eof-in-line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.eof-in-line-comment.d' matched 1 probe
diff --git a/test/unittest/lexer/tst.lc-in-line-comment.d b/test/unittest/lexer/tst.lc-in-line-comment.d
new file mode 100644
index 00000000..0332e1ae
--- /dev/null
+++ b/test/unittest/lexer/tst.lc-in-line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Line comments cannot contain a line commens marker.
+ */
+
+// Comment //
+BEGIN
+{
+	exit(0);
+}
diff --git a/test/unittest/lexer/tst.lc-in-line-comment.r b/test/unittest/lexer/tst.lc-in-line-comment.r
new file mode 100644
index 00000000..3075b987
--- /dev/null
+++ b/test/unittest/lexer/tst.lc-in-line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.lc-in-line-comment.d' matched 1 probe
diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
new file mode 100644
index 00000000..4deb66f4
--- /dev/null
+++ b/test/unittest/lexer/tst.line-comment.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: // comments are supported.
+ */
+
+// exit(1);
+BEGIN // exit(1);
+{ // exit(1);
+	exit(0); // exit(1);
+} // exit(1);
diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
new file mode 100644
index 00000000..d4e4c325
--- /dev/null
+++ b/test/unittest/lexer/tst.line-comment.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe
-- 
2.45.2

