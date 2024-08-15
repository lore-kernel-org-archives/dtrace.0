Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1A17BB15
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 21:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723756062; cv=fail; b=OVnAP+bw+4oX+dbbbMlRW/Ux6mGnt0kr2lMWj9A26SOcwpAEMDL7qWFQ6/joyuANjaiJmX2U344k/WPIkCP1OkDYnKN4Hb3cSO5LRY324FGDhF9hVo/t3tKP8CEeqDwKJPpCbHq+4YQ2RREnyCb3JkT3c7JG5CqkV22cMMt5QiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723756062; c=relaxed/simple;
	bh=AeKGHtdEx9xjCGTk5+H76HzX9Dm4hnDkJNcIv8i8Ks8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cEB7A5Lbi/Ss3jWGU8f+j85/rzaWpydYUGx9qzzb+Rkxz7LBwGOzXiBwsyPqyD+tII7FDZK0tJd4fecnffqMeqTMIasI/rL22kCwaRgdq81NB2yO6gO5slsVO6D+7Vf5RGs9Msb9OfdTC7sHjuR5r52nCcPA25DisqjvAhljKAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XwT+XA9g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OhFYazPD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XwT+XA9g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OhFYazPD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FJtWU3001399
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 21:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=QuLXvQiDafB18ZuP28bzSjZ0KcJitLBib/BXfbXGJOg=; b=
	XwT+XA9gksY0/JfV3VrGyG5c2cL29HgheYegx7q+0fMG1OWjnTkDFyR+kJkpsCkP
	8tXtbAVIL30YhtQXct2tMrrOjIMTQR+90iZxCsv7FSjOiejFjEE2hlb6YgjXnN2n
	evVJJu9JD0HWoq/ndKh7W+3fIjrbcbVRiQl9oFGl7+CTfi6QCLL67wAKwn2btX9+
	kNdAc88wOyPnzJv3SjCB0Bsb31K+gJoM2g3MFi7S1G7LgYuac4U+pHrMcJXNuqSI
	LjpP4ZLSWn7XK+4fhJFazVyYhLYtS4kcfvIhwnI8nR26zco8u2ar7L01ZzRp7Cc+
	Dh0EP05uT/SyhDVH3pCxmQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wyttkfjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 21:07:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FK3NtD017118
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 21:07:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxncnyx7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 21:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYUyCR772JtNVRwHySib4bDbXNLhHqKNWG2cx+IE/Yyh5IfymqgX6KBfp7g4zOFO7ITT+L7htTdklXdJBeX9V9aSwCyDmVbIAXA68ca5ovNuQgLP8RzIQ6kk0n+CrMYIz4iekbZ4tlhm5hJbLVpqktKgEQAEA2i5ZgxthWmj6U7kWCPeTB/+n7UREEl+0/3cqmzevHxMbufMJhGYMPa/GQBTCJyziyhDTKW2w3AFhONKziWyqJ5JjVaCLxs2t1eooFxMEisk6K+a6qRgubd87kK8dT4EBMoums4Z98K4mELWtj7EXEtit6NZpxRv6nb4/Xja2sb5gKRhRp1WJhyvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuLXvQiDafB18ZuP28bzSjZ0KcJitLBib/BXfbXGJOg=;
 b=g5uCz/YkZ2mdAV9rwb7HkPzbogH1E+FUTKGfr918m4JuYZL/jg51xRtkgjt+MUJ7zhAxnvUipvl9smoeKtYrDpxcyHE7PbrKyh14UNns1ocDKRows1XQzbomfQU9vNMcKM2/Vk87Y3+Pa2pvcOMAnH+VTPI75zV4P02yjnH+G3uJsUB2xGdO+r1ZbUT7egGXQfq7G9Df5npF3A3z/4BDK4duUhSgerVjNpseH3FlnLUewxNWTK701zFL3heij6E7HcC1chevPSXrKjZfCWHT4ojI9Zmu/FxcNOuGqYdkb2TMUMH7rDtHWQc0IktfPOUthNw5Rgz5G75tf2zMFUq4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuLXvQiDafB18ZuP28bzSjZ0KcJitLBib/BXfbXGJOg=;
 b=OhFYazPDp+pMPeJ+m/wvQVPp2KNdlxYqNna4SKNjTutcjXxjc3UsClvYjBfGSWLzENBm2Qqe1zHfwKzghU7mLwPX+Q2LPxOlsn2PGkMD6jp47ptBBvXHDP221S06dbSNS7ppoypDCUbfXZ2xm+SvT2/nNam57iyRnjsg/DL5t3g=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CYXPR10MB7950.namprd10.prod.outlook.com (2603:10b6:930:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Thu, 15 Aug
 2024 21:07:34 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 21:07:34 +0000
Date: Thu, 15 Aug 2024 17:07:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] agg: move aggregation declarations from dt_impl.h to
 dt_agrgegate.h
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:408:112::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287B6602E0EA3DAF6FA4532C2802@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CYXPR10MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: f5517607-b1a3-4dca-fbdd-08dcbd6e48ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oTEMLgl7+YtSuAwAYjUjG8I0z3eqsD/TkVKSTMRQx/sERf7+JWlKVZKKHsoU?=
 =?us-ascii?Q?hxc1YqolabQrNi3DGPh4+2pmuwuqCelI6/AzCXc/f2YlypTaDdTbftg4aPWY?=
 =?us-ascii?Q?8eVMM2CmkJhCWNrNGXW/4XmBuXd9iuy/4VLH1V5E7LIWgAmKJLP+fG+h/0oo?=
 =?us-ascii?Q?T+37PD/hoTKP+31RNaLqwcAoZQPKPObPQNIhCNZJaRpS2ssOnNr6m+P8SPXv?=
 =?us-ascii?Q?C9whAvyErfJtgT4TZzUVkMJcPpKYaZNXrs6sGyMeW2i164cTupX2sy2A4ytG?=
 =?us-ascii?Q?2cV+W9Oba9O2TjUpzOrHQ8KGyEbNg0jr2Ng1mBkWMBCoetZu/q58Bj5NQ+Bz?=
 =?us-ascii?Q?+YpDeDHXB12B786Vy3M3J0kcYJdNuls3U2FOdtK1e/2g2DbHe05ypCfOCD5O?=
 =?us-ascii?Q?Gq6acRuBhXzm2KubiOc90qW5WAE7u5jBTLMuTZ6eI6EdM+nN7GPLtT7JRqeo?=
 =?us-ascii?Q?ydHrNCq4moSxaUJnOY/9kfemSZ0MGPTFqQeduDDGX2dzMC1L3LbXzO7hEpeM?=
 =?us-ascii?Q?m0LLvsXfCu6TIvYa/rcr9BWW5Jn3tUw1Wyx2DtD2sB7oneYzqO3wsEPcCy7h?=
 =?us-ascii?Q?HbsKyV42Rv5JPxTd2T2JXjWKBblb4MS6eWX0q32YI5m9Rxm5FaiJZ6OtIPpS?=
 =?us-ascii?Q?iGfmHvxMja6eDX5A14qZVWOoNHlFCxPcbp4Kwcdfj9uLRsMP13fq62wK4Gfz?=
 =?us-ascii?Q?WdBLW4vNdMGuUxTJZ00kjB4aFNL0gVCfKUBLH5mVm0bwY0K4whW6dsx/Y9Pc?=
 =?us-ascii?Q?i6vO7FydJKzLYHKRbToPpI3u0x5M5UfYVmMTwZtmJJn5rIeO98s1eknT0RxG?=
 =?us-ascii?Q?bEIE669MOrQvPw+HdPD6j4oRv4U3TtFO28fW+4G/17olWKvOjjtc184TFbZN?=
 =?us-ascii?Q?Q35pbloUYpUcPGC4Ya1o65MSQ9/sG15IEr2IUjdMieanN6aH5x4qglsobaUY?=
 =?us-ascii?Q?J6U48AcwOJdFMwT3RBK6TMdDL3u0AC2uFi5rfSRjKYX0nRFdaX5wWp3aWvxR?=
 =?us-ascii?Q?WqzWYebBPr/GwNjkW0F1Jr8IqjE2BUXSaX2bE59Idwy0eNHhTNu2pVt9AUD2?=
 =?us-ascii?Q?twjYgPH8nHf1yG5OjfKOioMPzHAAGD1fu47bGsV5T/JE9ZD7L1ZhKPVL2SvD?=
 =?us-ascii?Q?mjBGfXuBU89HQq5e6LupiHHpREp30qVOxOrF+BzHbK/UqXamGJhm3hr29vze?=
 =?us-ascii?Q?C1FNSsEoCecqFLwcrJbOaLub9yhrhWTYybXzck4D7EIGeInpCm7ZyGdOZHaD?=
 =?us-ascii?Q?/riMW5BEErmC8WDRZF9G8KVAeiJ24Ijo/7Szqrze7jwL6q1qadL61GMYmpiX?=
 =?us-ascii?Q?dhSCK4DE2DnzAKI+OGt3bz2Ut5hm0Z3DrmsgdF7dKcmB28lsKA4Xre1zeS2i?=
 =?us-ascii?Q?NleQyeI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FjFlJe3mJLoPFpJnGlsmt4R4Pb93btWU7AChkSUMjcGjtpAhmRZDoVP3p9r?=
 =?us-ascii?Q?IHqFefLiZmMT21i42eA3NptpQzCdJo/hF4Ovxz1NOnXnrhxHDbN9b7//pbCo?=
 =?us-ascii?Q?1rhhZV67YiI0IP6Ojvg69R05O78d19vwj+EYFet6L2Sd/ArPH3HYNH3v4GC6?=
 =?us-ascii?Q?63eiwTKK8v/w3EacgiTDastPOlEqupxfAWAeh5tg3wuv7v3c0tTWZtZpnYLr?=
 =?us-ascii?Q?zFOzV/KiP04750gtfI2Xbi3vEZ4n4JTNmdY1xNAR/Av9wQc0PUnNKi+oQ2e9?=
 =?us-ascii?Q?KOHkUhSt95qym6yRQmsxKsVJZAAK8ZQzbm9CxoENuARjdiUn82ItxJBEMiSB?=
 =?us-ascii?Q?qQtN8lRzNnmoxCSyq7JCS31wwMQsWlMEVmXo0uuKrRKSDkbstr2abMs7A7in?=
 =?us-ascii?Q?ZqcGRzKUHsFiW4ih7iowABh+QxLUWt6sonlrpAL2PcCQgu4AePvM+Mzc9H4k?=
 =?us-ascii?Q?+OuaeWWzXlkOfREjExtOG3VcxK0zTnc5EF1Tu2w6ZQ1yHqkjHOn2c9ke/l3i?=
 =?us-ascii?Q?MUUaFx97gLvpBkDN7FeSpx4gVksAVEPOEXRxxJYfguyA4/a6+nfVArbK4f//?=
 =?us-ascii?Q?mi6FhE8Bnv3qoLnHNP47Drw0ycEh6Lq2shsiLdnZ339IHSr82zGVKPhxliRu?=
 =?us-ascii?Q?34ujJrhSxH67/G3ewP3xbo7CW4mx3sRUxWa1UKNfKZkQa0MXPfua/FtjlFcl?=
 =?us-ascii?Q?Qv6044MEuqAJ6PfzScooVFteLLdY0w0Y0x50dt+rdaaqJZquvUX+OejGqogG?=
 =?us-ascii?Q?FLac/tSri5Xw1wEgldzwRZGfxNfRR1bZqcHwds0i0NUltIR/Hnc/atlnh+ph?=
 =?us-ascii?Q?sIPDBrBnnDF8QrOMdEsNQcuhKGxV9lGz0BtCL3LiFO63kGzLs+dW/49cIBFX?=
 =?us-ascii?Q?RvGUWx3zpOAPmpgcK6OJQr3lAnGIpw1f8Kr52xb20wsWTOOEsKWLSLy4k+30?=
 =?us-ascii?Q?JGK9DU1a0pSZZB0g9NbcOKaO/Y+KInzFRxuMy4GegIPyfFMT7eRe99MOzMLp?=
 =?us-ascii?Q?WlNvMCIgbw/SKIA2ec8hSbZrjucnBKO/tl8on6hgoqpFCETE72LbbbD6FJeq?=
 =?us-ascii?Q?rrGIFZWHI5Id9yRwZR8iiw5TnUjiQU7mx7z2cKpesRKxV6GrFwwd/VvL62jP?=
 =?us-ascii?Q?y+bQaTQz/1f1XrBeF1YVcqpgYizSwRa9kFGN0OykfSTAVxzgCUSPdJrplm+m?=
 =?us-ascii?Q?aNjx8EOtq2AwcWk/N6aNVSMpo7m+cWhuzBEmMi3HRochcoQ+OQMdac48hjc7?=
 =?us-ascii?Q?U7fB2A09ZxcARstnOXQfI7FIebNFcFEt3qFko9B5n92FX3KQ5QFz92GIj2Do?=
 =?us-ascii?Q?GFbF4L5/DOo87xDoJvaKyer3CBIEk4KlSvW4VM23egNhv15Sy9KgGK/aVC+5?=
 =?us-ascii?Q?s0N50RUsSeUCVWs4CJBJ0hPATYyPvNHz6k7qYhFcZOHsbW13osxK3aredtol?=
 =?us-ascii?Q?8ta9GGHatSfEnkGWV3Fjqq78l/nDbAF8EkQD7LmrzbH53nVXqnMe8smxLf8s?=
 =?us-ascii?Q?h1RpN1q8Y8EDSZ6t9o30AyfkphxjflFn4GZkpSwJYi3XdVaNi+xqhh9jq6xX?=
 =?us-ascii?Q?h8KtJ6K+u2JmXZ4GzPWWW3avqHl43vjV1ph4Xho5Avj7L7NYTB2ielc7/4GY?=
 =?us-ascii?Q?TJtBbxSsbpUANgrxPO1e9uo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sladWVjyjFO47sWVUpigN4vV094A8W+siz77EKWOLaQwGkGZIRv9jbRkFLo9i6CVZkon1YoZveyOjIhQfyt5WSYgUgHuvd9VSwBAl7MMyRW7R6GsxYl1tQnHn8MiDvovXUWJyzHPKLdQNdwXJplKYgeKYY7W/GGgyk22oPjaHxh0Fs56duO8AWsClLkXNFdg9fiOxn6g65qrSJg91HVjYKKfwkkksnTGlXCLuw8GWG3JP/g0Ek7bXYB83HbICFiaouIvfUT/oRa4w2Pi6r3Mi9RB8PAjvpLD/uoJ1kYF9fU0l905kU6qYNGWWE8KZFmf4aJYZtUjXmw5ayy9A+DBavm8vIBP83covxwImvprZcXMpMHIUZxW1+59TpKGrbM9GbDuKdqyjFObSMhxxTos5fCE/QQyGO5aSSJr2Qbjc+XOmYKFhDEqjmoqPeWnbmBuDs83U8aOk8DxTLAGaHUxveoSWSq092Z+6jiUTTvjzyFSXYvHWckMwpYo+tihg/d4Wc9orA8iRMpQcpkUiNB+JWBIvPVDKoiDyRph1vnITcl4zIGvwRGhRecrEWHvlUtQ2XK5dW2Ap3ANOkezCo2bh2NMTJUIXbDzRmpX+Zp56b0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5517607-b1a3-4dca-fbdd-08dcbd6e48ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 21:07:34.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uok18QII4kTxkSHLoi2sfIEd9gmN8J9HlKARwQF/MWPFtoxS/NqZWvY6mfQBksjdPCgQzADB5/qLKuJlVjSTMqJsejryPIr6u9gEs3Dp0Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7950
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_13,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150154
X-Proofpoint-ORIG-GUID: Ry218TtEig56mrPWdL-ogkXYBKcDyKQv
X-Proofpoint-GUID: Ry218TtEig56mrPWdL-ogkXYBKcDyKQv

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_aggregate.c | 64 +++++++++++++++++++++++-----
 libdtrace/dt_aggregate.h | 91 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_cg.c        |  1 +
 libdtrace/dt_consume.c   |  1 +
 libdtrace/dt_impl.h      | 53 +----------------------
 libdtrace/dt_open.c      |  3 ++
 libdtrace/dt_options.c   |  6 +--
 libdtrace/dt_printf.c    |  3 +-
 libdtrace/dt_work.c      | 13 +++---
 9 files changed, 163 insertions(+), 72 deletions(-)
 create mode 100644 libdtrace/dt_aggregate.h

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 6472360b..329b8ffa 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -16,8 +16,32 @@
 
 #include <libproc.h>
 #include <port.h>
+#include <dt_aggregate.h>
 #include <dt_bpf.h>
 
+typedef struct dt_ahashent {
+	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
+	struct dt_ahashent *dtahe_next;		/* next on hash chain */
+	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
+	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
+	uint64_t dtahe_hval;			/* hash value */
+	dtrace_aggdata_t dtahe_data;		/* data */
+} dt_ahashent_t;
+
+typedef struct dt_ahash {
+	dt_ahashent_t	**dtah_hash;		/* hash table */
+	dt_ahashent_t	*dtah_all;		/* list of all elements */
+	size_t		dtah_size;		/* size of hash table */
+} dt_ahash_t;
+
+struct dt_aggregate {
+	char *dtat_key;			/* aggregation key */
+	char *dtat_buf;			/* aggregation data buffer */
+	char *dtat_nextkey;		/* next aggregation key */
+	int dtat_flags;			/* aggregate flags */
+	dt_ahash_t dtat_hash;		/* aggregate hash table */
+};
+
 #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
 
 /*
@@ -34,6 +58,21 @@ static int dt_keypos;
 #define	DT_LESSTHAN	(dt_revsort == 0 ? -1 : 1)
 #define	DT_GREATERTHAN	(dt_revsort == 0 ? 1 : -1)
 
+int
+dt_aggregate_init(dtrace_hdl_t *dtp) {
+	dtp->dt_aggregate = dt_zalloc(dtp, sizeof(dt_aggregate_t));
+	if (dtp->dt_aggregate == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	return 0;
+}
+
+void
+dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
+{
+	dtp->dt_aggregate->dtat_flags |= opt;
+}
+
 static int
 dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
 {
@@ -503,7 +542,7 @@ static int
 dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		      const char *data)
 {
-	dt_ahash_t		*agh = &dtp->dt_aggregate.dtat_hash;
+	dt_ahash_t		*agh = &dtp->dt_aggregate->dtat_hash;
 	dt_ahashent_t		*h;
 	dtrace_aggdesc_t	*agg;
 	dtrace_aggdata_t	*agd;
@@ -621,7 +660,7 @@ hashnext:
 
 	memcpy(ptr, data, size);
 	agd->dtada_data = ptr;
-	if (dtp->dt_aggregate.dtat_flags & DTRACE_A_PERCPU) {
+	if (dtp->dt_aggregate->dtat_flags & DTRACE_A_PERCPU) {
 		int i, max_cpus = dtp->dt_conf.max_cpuid + 1;
 		dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
 
@@ -658,7 +697,7 @@ hashnext:
 static int
 dt_aggregate_snap_cpu(dtrace_hdl_t *dtp, processorid_t cpu, int fd)
 {
-	dt_aggregate_t		*agp = &dtp->dt_aggregate;
+	dt_aggregate_t		*agp = dtp->dt_aggregate;
 	size_t			ksize = dtp->dt_maxtuplesize;
 	char			*key = agp->dtat_key;
 	char			*data = agp->dtat_buf;
@@ -692,7 +731,7 @@ int
 dtrace_aggregate_snap(dtrace_hdl_t *dtp)
 {
 	dtrace_optval_t	interval = dtp->dt_options[DTRACEOPT_AGGRATE];
-	dt_aggregate_t	*agp = &dtp->dt_aggregate;
+	dt_aggregate_t	*agp = dtp->dt_aggregate;
 	int		i, rval;
 
 	/* Has tracing started yet? */
@@ -1104,7 +1143,7 @@ dt_aggregate_bundlecmp(const void *lhs, const void *rhs)
 int
 dt_aggregate_go(dtrace_hdl_t *dtp)
 {
-	dt_aggregate_t	*agp = &dtp->dt_aggregate;
+	dt_aggregate_t	*agp = dtp->dt_aggregate;
 	dt_ahash_t	*agh = &agp->dtat_hash;
 
 	/* If there are no aggregations there is nothing to do. */
@@ -1149,7 +1188,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
 {
 	dtrace_aggdata_t	*agd = &h->dtahe_data;
 	int			i, ncpus = dtp->dt_conf.num_online_cpus;
-	char			*key = dtp->dt_aggregate.dtat_key;
+	char			*key = dtp->dt_aggregate->dtat_key;
 
 	memset(key, 0, dtp->dt_maxtuplesize);
 	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
@@ -1171,7 +1210,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
 static int
 dt_aggwalk_rval(dtrace_hdl_t *dtp, dt_ahashent_t *h, int rval)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 
 	switch (rval) {
 	case DTRACE_AGGWALK_NEXT:
@@ -1281,7 +1320,7 @@ int
 dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
 {
 	dt_ahashent_t *h, *next;
-	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
+	dt_ahash_t *hash = &dtp->dt_aggregate->dtat_hash;
 
 	for (h = hash->dtah_all; h != NULL; h = next) {
 		/*
@@ -1302,7 +1341,7 @@ static int
 dt_aggregate_walk_sorted(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
 			 void *arg, int (*sfunc)(const void *, const void *))
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 	dt_ahashent_t *h, **sorted;
 	dt_ahash_t *hash = &agp->dtat_hash;
 	size_t i, nentries = 0;
@@ -1428,7 +1467,7 @@ dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp, dtrace_aggid_t *aggvars,
 			     int naggvars, dtrace_aggregate_walk_joined_f *func,
 			     void *arg)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 	dt_ahashent_t *h, **sorted = NULL, ***bundle, **nbundle;
 	const dtrace_aggdata_t **data;
 	dt_ahashent_t *zaggdata = NULL;
@@ -1829,7 +1868,7 @@ dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 void
 dt_aggregate_destroy(dtrace_hdl_t *dtp)
 {
-	dt_aggregate_t		*agp = &dtp->dt_aggregate;
+	dt_aggregate_t		*agp = dtp->dt_aggregate;
 	dt_ahash_t		*hash = &agp->dtat_hash;
 	dt_ahashent_t		*h, *next;
 	dtrace_aggdata_t	*agd;
@@ -1864,4 +1903,7 @@ dt_aggregate_destroy(dtrace_hdl_t *dtp)
 	dt_free(dtp, agp->dtat_key);
 	dt_free(dtp, agp->dtat_buf);
 	dt_free(dtp, agp->dtat_nextkey);
+	dt_free(dtp, agp);
+
+	dtp->dt_aggregate = NULL;
 }
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
new file mode 100644
index 00000000..33921a72
--- /dev/null
+++ b/libdtrace/dt_aggregate.h
@@ -0,0 +1,91 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef	_DT_AGGREGATE_H
+#define	_DT_AGGREGATE_H
+
+#if 0
+#include <sys/param.h>
+#include <setjmp.h>
+#include <sys/ctf-api.h>
+#include <dtrace.h>
+#include <pthread.h>
+
+#include <sys/types.h>
+#include <sys/dtrace_types.h>
+#include <sys/utsname.h>
+#include <sys/compiler.h>
+#include <math.h>
+#include <signal.h>
+#include <string.h>
+#include <stddef.h>
+#include <bpf_asm.h>
+#endif
+
+#ifdef	__cplusplus
+extern "C" {
+#endif
+
+#if 0
+#include <dt_bpf_maps.h>
+#include <dt_parser.h>
+#include <dt_regset.h>
+#include <dt_rodata.h>
+#include <dt_strtab.h>
+#include <dt_symtab.h>
+#include <dt_ident.h>
+#include <dt_htab.h>
+#include <dt_list.h>
+#include <dt_decl.h>
+#include <dt_as.h>
+#include <dt_proc.h>
+#include <dt_pcap.h>
+#include <dt_dof.h>
+#include <dt_pcb.h>
+#include <dt_printf.h>
+#include <dt_debug.h>
+#include <dt_version.h>
+#endif
+
+typedef struct dt_aggregate dt_aggregate_t;
+
+#define DT_AGGDATA_COUNTER	0
+#define DT_AGGDATA_RECORD	1
+
+/*
+ * Aggregation functions.
+ */
+#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
+#define	DT_AGG(n)		(DT_AGG_BASE + (n))
+#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
+#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
+
+typedef enum dt_aggfid {
+	DT_AGG_AVG = DT_AGG_BASE,
+	DT_AGG_COUNT,
+	DT_AGG_LLQUANTIZE,
+	DT_AGG_LQUANTIZE,
+	DT_AGG_MAX,
+	DT_AGG_MIN,
+	DT_AGG_QUANTIZE,
+	DT_AGG_STDDEV,
+	DT_AGG_SUM,
+
+	DT_AGG_HIGHEST
+} dt_aggfid_t;
+
+extern int dt_aggregate_init(dtrace_hdl_t *);
+extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
+extern int dt_aggregate_go(dtrace_hdl_t *);
+extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
+extern void dt_aggregate_destroy(dtrace_hdl_t *);
+
+#ifdef	__cplusplus
+}
+#endif
+
+#endif	/* _DT_AGGREGATE_H */
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 164f9e5f..cce2535c 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -16,6 +16,7 @@
 #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_dis.h>
 #include <dt_dctx.h>
 #include <dt_cg.h>
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 07856746..6ad73324 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -14,6 +14,7 @@
 #include <ctype.h>
 #include <alloca.h>
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 88b31ce0..fa2b2602 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -83,6 +83,7 @@ extern "C" {
 #define DT_NULL_STRING ((uint16_t)0x7f00)
 #endif
 
+struct dt_aggregate;		/* see <dt_aggregate.h> */
 struct dt_module;		/* see below */
 struct dt_pfdict;		/* see <dt_printf.h> */
 struct dt_arg;			/* see below */
@@ -197,21 +198,6 @@ typedef struct dt_kern_path {
 #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
 
-typedef struct dt_ahashent {
-	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
-	struct dt_ahashent *dtahe_next;		/* next on hash chain */
-	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
-	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
-	uint64_t dtahe_hval;			/* hash value */
-	dtrace_aggdata_t dtahe_data;		/* data */
-} dt_ahashent_t;
-
-typedef struct dt_ahash {
-	dt_ahashent_t	**dtah_hash;		/* hash table */
-	dt_ahashent_t	*dtah_all;		/* list of all elements */
-	size_t		dtah_size;		/* size of hash table */
-} dt_ahash_t;
-
 #define DT_AGGDATA_COUNTER	0
 #define DT_AGGDATA_RECORD	1
 
@@ -245,14 +231,6 @@ typedef struct dt_tstring {
 	int		in_use;			/* In use (1) or not (0) */
 } dt_tstring_t;
 
-typedef struct dt_aggregate {
-	char *dtat_key;			/* aggregation key */
-	char *dtat_buf;			/* aggregation data buffer */
-	char *dtat_nextkey;		/* next aggregation key */
-	int dtat_flags;			/* aggregate flags */
-	dt_ahash_t dtat_hash;		/* aggregate hash table */
-} dt_aggregate_t;
-
 typedef struct dt_dirpath {
 	dt_list_t dir_list;		/* linked-list forward/back pointers */
 	char *dir_path;			/* directory pathname */
@@ -387,7 +365,7 @@ struct dtrace_hdl {
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	int dt_maxformat;	/* max format ID */
-	dt_aggregate_t dt_aggregate; /* aggregate */
+	struct dt_aggregate *dt_aggregate; /* aggregate */
 	struct dt_pebset *dt_pebset; /* perf event buffers set */
 	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
 	dt_version_t dt_vmax;	/* optional ceiling on program API binding */
@@ -593,28 +571,6 @@ struct dtrace_hdl {
 
 #define DT_ACT_MAX		31
 
-/*
- * Aggregation functions.
- */
-#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
-#define	DT_AGG(n)		(DT_AGG_BASE + (n))
-#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
-#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
-
-typedef enum dt_aggfid {
-	DT_AGG_AVG = DT_AGG_BASE,
-	DT_AGG_COUNT,
-	DT_AGG_LLQUANTIZE,
-	DT_AGG_LQUANTIZE,
-	DT_AGG_MAX,
-	DT_AGG_MIN,
-	DT_AGG_QUANTIZE,
-	DT_AGG_STDDEV,
-	DT_AGG_SUM,
-
-	DT_AGG_HIGHEST
-} dt_aggfid_t;
-
 /*
  * Sentinel to tell freopen() to restore the saved stdout.  This must not
  * be ever valid for opening for write access via freopen(3C), which of
@@ -828,11 +784,6 @@ extern int dt_reduce(dtrace_hdl_t *, dt_version_t);
 extern dtrace_difo_t *dt_as(dt_pcb_t *);
 extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
 
-extern int dt_aggregate_go(dtrace_hdl_t *);
-extern int dt_aggregate_init(dtrace_hdl_t *);
-extern void dt_aggregate_destroy(dtrace_hdl_t *);
-extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
-
 extern int dt_consume_init(dtrace_hdl_t *);
 extern void dt_consume_fini(dtrace_hdl_t *);
 
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 5c922488..77ffb6d2 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -28,6 +28,7 @@
 #include <libproc.h>
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_bpf.h>
 #include <dt_pcap.h>
 #include <dt_program.h>
@@ -740,6 +741,8 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
 	dtp->dt_nextepid = 1;
 	dtp->dt_maxprobe = 0;
+	if (dt_aggregate_init(dtp) == -1)
+		return set_open_errno(dtp, errp, dtrace_errno(dtp));
 	dtp->dt_vmax = DT_VERS_LATEST;
 	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
 	dtp->dt_cpp_argv = malloc(sizeof(char *));
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 997f11a2..2f7917a0 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -20,6 +20,7 @@
 #include <ctype.h>
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_pcap.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -27,12 +28,11 @@
 static int
 dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
-
 	if (arg != NULL)
 		return dt_set_errno(dtp, EDT_BADOPTVAL);
 
-	agp->dtat_flags |= option;
+	dt_aggregate_set_option(dtp, option);
+
 	return 0;
 }
 
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index e999498c..21ec7411 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -14,10 +14,11 @@
 #include <limits.h>
 #include <port.h>
 
+#include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_module.h>
 #include <dt_printf.h>
 #include <dt_string.h>
-#include <dt_impl.h>
 
 /*ARGSUSED*/
 static int
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 69a86358..13483301 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -5,12 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-#include <dt_impl.h>
-#include <dt_peb.h>
-#include <dt_probe.h>
-#include <dt_bpf.h>
-#include <dt_bpf_maps.h>
-#include <dt_state.h>
 #include <stddef.h>
 #include <errno.h>
 #include <assert.h>
@@ -20,6 +14,13 @@
 #include <linux/perf_event.h>
 #include <sys/epoll.h>
 #include <valgrind/valgrind.h>
+#include <dt_impl.h>
+#include <dt_aggregate.h>
+#include <dt_peb.h>
+#include <dt_probe.h>
+#include <dt_bpf.h>
+#include <dt_bpf_maps.h>
+#include <dt_state.h>
 
 void
 BEGIN_probe(void)
-- 
2.42.0

