Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9A626F291
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768515780; cv=fail; b=i3b2Ix1fPHhm0VBog1QSrBXDqtq3plE6+hBFS4OutFFtjvMaQyS8yPwogyaCfq2MxuTeZVkNPcBKGzrtOTJnvH6IXCYGJVd3d+3IsuzsXaFkzro1erQd8e9VWfE2ude+zmw7D3WXc6iAuiVFbt7lk1D9/J/o1/xo7HfExM0bt5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768515780; c=relaxed/simple;
	bh=1IN7D7T4pp0KfYFO1em/RtTdbuhQxAL4LYFXgPzWuRA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WDkmO4d6NUM1iSqC6VeSwt2La598iZKqDu+89X9DtgSimvZQQLFnKZjAMZCjQbQyoxeiFmEGKgoN7/x107plSlu09u9kC54O78c7OJUIN2YwLorPuQYCP5Ly6bMrSZXsdXtoIcl4ZE6/8w38UA+YQgM8mwejEK4ZIIwGyUo4UNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IunMsMt4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sf8OtFMe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IunMsMt4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sf8OtFMe"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FLhNGI1008313
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wiqjRbfTyMJ3aa4q0+muU5fhcjK9VaI73IkPQBGqypY=; b=
	IunMsMt4t2jYyFOSo1SjgNK0wgMKGomzedQTKEXFnXdMgWYtrg+Oh1rKSzAm7kol
	Vo9stW01wIF9216EW62QUnFCy0LyOGGwvJgtPC/ITNSyfWnmKWBqqEbIdATwCPAH
	xBKO8vavr+AOf/lqVv5PtHxXG8cNr13BGhth8PpeHrMfs+3kvDXWoqdyiebnZkAt
	boOBhEm8Ts/HkhQrszzBbkNTo4svM8k3Mh+k8C+sxSF3CLmf/rd9djWDPWUOtyw1
	Zr21M8k7/lBnAawXq2t1gnCCM47xvjLTAsMCqJlUVqUU3ChPef9Qp9IVnZriXS2e
	6zPYvZYRvhUweKqcItJU3w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq58vsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:22:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLXASp000401
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:22:57 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7fq5s1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuRYUm3YYXX/MP4vDJDnemLp75dnaXiSABvIDodwvfDGEl/xteAgwkZr10orYRCSkBAdg0nOqfVVjWj3r7m0mBx9oyN6dadJ0qYJtuvYP5w8ben5Hh/yHUzVe/qNltPzwbY347dHOaz9nY2CBaMAfSNL6lAOYZ9xqPuZA3sJ19rRwYFZthNVaHCVaVuda3MaoFXX99drkBCMeWYyk7ip+YwrzFT6ncsTdO70rCicXlrgeiOVEYMRC28ETHKaS7O+FQepnkEU7dbZBTnqqyrDeMY50ELGLlkHl7KMT7AWGJ8siNe2iODmyxIpEd/vj2K8wR+O14yko5uvNchCSwlBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiqjRbfTyMJ3aa4q0+muU5fhcjK9VaI73IkPQBGqypY=;
 b=KYGFDSAjTmx3jWUerQsBHJN3ojTJIlLLF4DgiAdofPzc7je1yVUZmQASjRnp1BKs86N6kgh3q8CCGsmoHoOybhk6Pn2+BO+g+m3d0y1D/1tbRAnziOc2vsts2HmgU4ih+jQS/Zk7bWe3zGxsFzmboKpMCgkdGcV3Yf1yI58GGjXq3iQliW6JtWCMfFRlr73qhBHpdC1SoZCdtgDXh9WiilYelFwQ2rw1Ib1Ca6aLsi2NrqQbHxkUZpDc2JKEDHXtwh09mw77CFIF/bf1+33Ml05fcrJnanJ+gLLhJzT3ejt40ZmfBg36HjKXnrM89hINn8esGEH9kHiUpRpdbQ/8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiqjRbfTyMJ3aa4q0+muU5fhcjK9VaI73IkPQBGqypY=;
 b=Sf8OtFMebwKjEx2GqRVU+Xv+/FmjT7xmw8VEGv2/DQQH7KHtxYAsbFiRCHvhdSuZ6gfCoEomf1iC/pK+slciHvItIayyVeYFH4FL6UVKxVKd4iGBn/OJ2GTl00I53dc6oJ4cur0UivnWlKXtQW4ONIKEwlFGLsM7T6Ckv791DU0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6232.namprd10.prod.outlook.com (2603:10b6:8:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 22:22:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:22:54 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Guard against inserting the same provider twice
Date: Thu, 15 Jan 2026 17:22:51 -0500
Message-Id: <20260115222251.7228-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:510:324::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3488782d-d087-482d-d431-08de5484a0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QZL3aSPyGTMB5janCsBNNTINXPOyUIs3EBdnlR0v5YQ8jTu3IdqizrnP8dhf?=
 =?us-ascii?Q?z0md842GRGFBwmXkM7a4NsCeijvCrG9i8Brg+MG2+DHFUhrvs5N8UrkwhxhS?=
 =?us-ascii?Q?sWvma9mVbEvI81hTMUBRBzUMxpzurnepjsJWjvUzkvAIcPekOII/ome8vs0S?=
 =?us-ascii?Q?JI4wQCT8x4Q/qC+LD6r6k+kHadfi1pfoe7IbuRI8X8QL6kcyVk5Eea6EzJol?=
 =?us-ascii?Q?QP87kBO7lbZPO8fYxvCrBFRvGCauuLC8z1aZOnU4l0/tScO+WbYZk9EZh0yv?=
 =?us-ascii?Q?gCeW4u6W5yEEY30YEeiskz01rtdABwko4/OpXHL5mG/vYc4bbt6gq2FqTRzw?=
 =?us-ascii?Q?nQRx3YvORuKd6KA9/SWeEJTDbB/eHY8li4tbsaqY9apMtBMa0BG4MWghOs/W?=
 =?us-ascii?Q?K+Xd8b9/uCzXrP2QUHvzFkzPtU6titlXP0ECf48PgWb+fNW0NhMmku3HCqSR?=
 =?us-ascii?Q?HL6oSM7FfpjNcxTgD+/qwcdV5ycsdLDqdOqy6hh6zgMBMbTANPQaDYPxjPpB?=
 =?us-ascii?Q?5uffeNCXb9GbHln0iMpSR9RvhO9+fwQN0PbydYYFXA24BuqlULPXOYCuXIyP?=
 =?us-ascii?Q?IhlztGcNWfyV8gHKS8cbwZ8d27v+TGLGF8ip2sOf6SxGaYa3a/DnZ7yXXSKe?=
 =?us-ascii?Q?FLUPSLpeYCWnRkGqgTaNR2UhyhDRwe+Arx13iE0+priag4Cjaem0h7vVH3KB?=
 =?us-ascii?Q?+M3IYYlP3lS+Tk3oOUziCrp5BgyYk1xZ3aqu9mVHl0uux+QvsPUZLIBFA9HL?=
 =?us-ascii?Q?oCt7lwPrnBnVI1to1eFex8ZGgCr0a83VdLgfvLyEn/I8cYLenPKDrTgNseKx?=
 =?us-ascii?Q?LGagIKU7DPX34syIk7EgYMpvPjquRalHdv8WNMnFLD5Q5gB8W7H1CTY2xh/m?=
 =?us-ascii?Q?9GY/qWfGN55hIdoZD1pSsoiFmjPRy9NZ25MidWr+wfx475SXmW0HOl6lPHis?=
 =?us-ascii?Q?/uObypGE8sCSRVy74k18vG8VsvnagzKf4Ph23Pj6tNpvDA+jDA96SZ8Vjt+U?=
 =?us-ascii?Q?KqaVtZoVhMy4qFCfNdxaY7p0Shq326t3wvlODbWiWvrIsg/g3SA2H9tmwQXV?=
 =?us-ascii?Q?tnfzttf/7DDDfRRxb86Sg55nZd7PMmtY4VG7ka+r/J9wkjH1ejrANTDdZeFa?=
 =?us-ascii?Q?aKp0Pub+LNA3MaBtnX0DMD5PLwQ3RqRGcnn6ITwWxzQ+padJ2bLFRymIxq9X?=
 =?us-ascii?Q?pRlF2mprx0FuW+/rLybzGW8bDjUOQqW4wjSmZatI16Luv8ZN0Exq/A4nYz/i?=
 =?us-ascii?Q?05lUxADISpCG1T3UyxeG8zDsoplxE+3zsj6YfV1FjbBaPGKnNea9jAUupZpE?=
 =?us-ascii?Q?ERsM7qSZmt6TW8uMQP+z/PGxOwf+X8d+nT0F2Wd2MUuH31zHCJQ3Bjgbrb5X?=
 =?us-ascii?Q?bNo44oj44r/xUZfPlLUcBykx/6RPewPKCGwQZ7QkvJQXrqhOmHRT6KvKoItU?=
 =?us-ascii?Q?6A8jknj2V0jC9UcyyVO3B1vKEnX69o2v1FWSfN1NulVETWuZE3HcesmmLoPE?=
 =?us-ascii?Q?cLEdLLVtxirZ7GU3OfTCx0AEaF+Vy9bGGl45ClJcWS4FJUC4P9eIOpHzsU5x?=
 =?us-ascii?Q?BwUZc31BwvBWhkIU2KA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TUCrIhE+hoK6UVtOU9SQf6VZwL+u4K+aKI924ZHKg41gI9J0+09O58NTaCCj?=
 =?us-ascii?Q?/nA3wIjvWr2wT2wcyaAIgJx8wsc+89rOl0oZ3zc8Yrm5B8NCS+ox+qV1fMW2?=
 =?us-ascii?Q?jZsjeSH2KfVyQ0ePbZrdn/ZMapqg0qWFDZ2i6ZNvRRQKGy+dzTSMOF0fToVr?=
 =?us-ascii?Q?v2BlQAQcVtpYVJa73Fy0XIzdYykhIk9/koshGEnWyCOkWOMUYnWaLkcNHYXe?=
 =?us-ascii?Q?9xadvLFLAQycR1PQb/vpQcl2e7jbewsl9mCVNM1ysZjOKwCs3T01Aj+VAbfc?=
 =?us-ascii?Q?hEo2WLL1QNNfDfjJ3YZjEL/zhVbk8jInWOTk1opJU3N9z3UEtVcl5/B9wFYe?=
 =?us-ascii?Q?1Qx60myVbLjjMWePMixYc5mdVI3+qFw85B4sWAKseBl/k1eKOE+d2nGm5soq?=
 =?us-ascii?Q?JZcNhCg9Zznjk1V/aJ7mkLJiA06q1n71JhZP9IDO59UeWoeVulgAH818KS3L?=
 =?us-ascii?Q?hcxJIOnyS53GTJSrSBwoL2h0/JSHzFbVW8fH+4lV2DM6MpXm6trKs0Xt69ML?=
 =?us-ascii?Q?ayORxKXEO8kMuIxrZSi7vj79C2RiZJCtr/Z7sJBg3CQjpZUzholgh+1HepgI?=
 =?us-ascii?Q?/czatt4fh/v2oQTRql3NWiEizA3gc10FQjpJZfSt4+jhk59dk4CcjP2A6J8j?=
 =?us-ascii?Q?3gZYJGnIgtclIBvY5ZWp0QddEd4IJGqDNPIv7JnVsNtqSJPq1tmltpVHOcx4?=
 =?us-ascii?Q?bpqZWuaVufSbDa04yqsIWKio1wVX8wgNhLZM0URdFc3CRNpRN1MnXunQW3kB?=
 =?us-ascii?Q?DljuuTPGebLshiP+86PZ9r6BrRKBTzwOE4XI/5nYT4GsUFUG0IkwRBvElUr7?=
 =?us-ascii?Q?omORq8/teZDYlCtJqJut3vNO6d9tm6EbVsJFWvgdJFePYjINZrDcT2r6Vkg8?=
 =?us-ascii?Q?SNBTwKarn+xgPkBUqgcOh4ZxksdTjKLiIyZgoL8JCQFOhg6PBAgbUZTlN/N3?=
 =?us-ascii?Q?Ma9K6Gyqi1BgtBC8ASt1WKgUeUsUcwpPcFd382n11w8ceZTxcIJAfInVMCJD?=
 =?us-ascii?Q?sQtjROJ3NkPvmZZdVj88HzwyWLO0xmaU/MUmXhn6wD5Zt0DTA0GHvxxW0xKU?=
 =?us-ascii?Q?h2Mz+FtlGZJFRnqzJcIu7lOBYQ+scZ7sRVy+mMAXBMTbMO6VywoyrXFTIBjy?=
 =?us-ascii?Q?aWflJPZLHB3dj98EGL7ANptn4sJv4uMM1VSC1wHaSbxIOD9M/nKdwwZ4C0HJ?=
 =?us-ascii?Q?prf43gNZHeDLZWdlG8VoOLlVYm5rL3AV48eC6MC6m7ycKsgxstkkPvP6K2o1?=
 =?us-ascii?Q?PyC+Wrp21K+vto17IIl0rk+cbRlEMizkP3O5yY6oCySpClR82i5b/hMCho7n?=
 =?us-ascii?Q?aQjwfYFXoAHiQgei5XiHlzSl1UQJhHqXsauFVwj5mP/KcJPIxG5Z9bTfhjWq?=
 =?us-ascii?Q?KtgTPE0ya+9wP5C4aH+veBChca8jHXTh0maua1zPimzEbB7DW3Fmq4qyUkYY?=
 =?us-ascii?Q?TPfWoE4AGM9inLywuVMZgHrjoRGCbEvI2na+qEB5Eid2/liYdvSoRE03l1+b?=
 =?us-ascii?Q?CIhBnC7aPoLmf6BBhAUvFJRETDApYPUeruX7ru5W4cSEGf5us3TvjtxoJIBU?=
 =?us-ascii?Q?K7aI4UzAZUVXEwfywtiQl7iPL+8jQDi0qaB/XF5UxdmQ3YTVF2vvMiv7PC4M?=
 =?us-ascii?Q?FS8cUKYdqDkrsT3qEk9XDWLUisNH/Me7obORAOWtcAzJYh9h9Fgi8FDXpZ16?=
 =?us-ascii?Q?ivFTIObCjQix4JI292L3fl3nZFL8YwtcTQYl7Ee1/iUEXiXGVNh2jCUdUW9y?=
 =?us-ascii?Q?X9teIONbqA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fKy5G6LBq0Opu44FaK9xJEzl+toeRsQwsh3MAaLsYQGgLKWDYju9Ih4SX2tNQHaCzJ9CT+by/cXpIIFWQDUBKjX3jaUK8rASgZr4Y4QO0yao3uXF2XEDpThhGO/YSWgbfFW9vr6Czt3J8Y3VTlTm8LQvluh0b4lNCVJDDkfEtrROzScy01oefDvq8zlFhZiw9+lEz3e2v2AU2w0QSL743jineQrc9Epbwdn4n5WXYGE497enMs7H6FVjfMOQrNO0iHCcxZYHyTX7D43KDZRJ7dXuVREuv7LBptMy+P1DLvDukJvUBpO+LDSI5p6uKLTGSoghVneGDKSPdD7Im7NrugnsfYFVt9NsaeY0NOuXwFigBEpABuukeavrmDsKPp88ejOuOPvrTYc5IbldQLUE3QgrJIfKBj3YpMTMQI4wKkKBox0PBEDWQszu8xi7PgQrXcI3poomncjq7rjKPcO8OadStctmzC245t/cHQVAmm4SHxrkp9m4nG0NHS0aZWLPQ6nzZMEHkd3xPUJSp6dm0J0TFFHGzRxuINCDVUmgyYplA2DR5XvM2a75ub61WGG/n/LdMaOZlT6iwj+Fx1Rmn9NkH+G5Lf5uEV0PzCMhp0E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3488782d-d087-482d-d431-08de5484a0a6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:22:54.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idlmudWDvoDj793J7h9zOyaS6SVdazsdOnAwHJTeQyDh4U2DFaxwv8/p/dVaMSTvDSg+5Xrrfmpdb+YL+JOdNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6232
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150176
X-Proofpoint-ORIG-GUID: QpGPOVTgWK_gAyBEVXjAn-W2wAMKXt0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NiBTYWx0ZWRfXxyw3cKO6SFGl
 vswnzV/6E9ovem8ow/bDlWG3D5G8jrXTjOYN9WnRihK/xh/tz3SpiEp93LCgEqDu0K/EIfzzJhW
 lB7f3WuW6PfCdEbKjqCjZRCALBV0Wv07Rpbz73fIXXCoXPZ2MC3DjmOyLY5jyeyxoCe5x6bLhEQ
 x21JZHlPxTqu5RbDQXl7AkYDHu5AvHzeEJw38dhBaSik/JHtrBru6UX0aOAeo2iRiT3pOvWcPXZ
 LhhD9h5dRH4+355yjhFaD/EVPnb+b5BGW+Z0XjuZ6viCwPeCPvQ3SledJA5fBjme9Fpa4lRPH8d
 z0U7A2WIrjQzfsJyjZfU82FbE8cZDHbO0ttubODAyUbGVqHioUvo9m+6mrgD4azJR/h46rSlNnn
 wVnc7gPXcgmoY5ajipMs3BQrLlUyxNXA8fFGPKi1Pn1Ql3y3ruxQcbP0B8sI2rUzQuhLMkLT6aY
 cEp9rn36c3Xb13g5BP7JAKctRq/Do7CnV2ak7UCg=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696968c2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=tnq0Zz-3rp8N3d1d7skA:9 cc=ntf awl=host:13654
X-Proofpoint-GUID: QpGPOVTgWK_gAyBEVXjAn-W2wAMKXt0Z

From: Eugene Loh <eugene.loh@oracle.com>

Add a safety net to dt_provider_create(), to check if a specified
provider has already been inserted.

This also requires a corresponding change in dt_provider_lookup(), so
that it will work even if no providers have yet been inserted.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 848fdc132..9d75225fa 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -114,6 +114,8 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
 		return NULL;
 
 	strcpy(tmpl.desc.dtvd_name, name);
+	if (dtp->dt_provs == NULL)
+		return NULL;
 	return dt_htab_lookup(dtp->dt_provs, &tmpl);
 }
 
@@ -124,6 +126,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
 {
 	dt_provider_t *pvp;
 
+	pvp = dt_provider_lookup(dtp, name);
+	if (pvp)
+		return pvp;
+
 	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
 		goto nomem;
 
-- 
2.47.3

