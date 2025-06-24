Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FF145355
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750801236; cv=fail; b=SmLVtCi1PewdEm0PoOVxJAPjG80HoTJE9CtKw9MVZLQwM49n1w8OEmww5yc7puSu3Kn2eGNAAcgDDEI3hdrmx6BpWiIQ+PdXoHlFre0LqJHHtvdUzBqejSZcdOQphdkMDMbmrSluB4LNT7meKWlqWkaimkZ59vaOKTvC1gifG9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750801236; c=relaxed/simple;
	bh=GwwlNyOcFeP9u5ApvICBHbQINgwNuXOewCMsvFdxSK8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=PHD39OO06jYT0K2dTKLjJGbAeHN9E+GerVl/+DOyOJAg6JwaTU2+mcUue9tlyEBaFG0EgAyQBE7gAKLK4ONqbkyX20/CaxMgrdO3N7NrLoWH/rxudkJv0QXEW8af+7W5JZ3FcQwuf3JnvDj2uJpvBHdWVGWs3e3OfAWP4/HaxPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lXLoqXOk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BmEd536K; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lXLoqXOk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BmEd536K"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OL1xdj023912
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xJYdguksPEo2xar/I0XhteAjQubkVRT1ojND6dR7BJc=; b=
	lXLoqXOk04lT213dvP/SNdMY/8a2RR8yexcwc/o1o8QpH1bzODsKpX4P9MCdHRBw
	ImhOCnXLUCk8/N/wqBRMbe7LjPrSXZG/Ap7wc272r79qDYmRnlVXd96v72ebklhz
	9Tl5DTdY9M9dSVMu/T6oClh8hxUvamsrCM1e6fIurVTALcMm7DQCUf5D7LtumnCo
	H9ggopVdkD/oHFOfow0YZYdIPj8DHUP3Zwv5jsoNINrBC1OL9sUM01QcxcQGKPi4
	UnsstKIXtBpVLiYxICF30KO7vo8nqSeB9d11jPS53dMTnpJkBXewoh00Y74/HZv3
	Iya3ztB28yp5DLeUPkhIOg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumn423-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OLKBHG008213
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq47ek2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAVyMQKw+bfp1oc0Arkx6mm8E5D7PIF5iDsJ88vPqkxnj+ljR+FqbbMeOIey5+t4ajIgCKgEiH/qaErY5SyCRCm+aeTu41beO5ro++AYM+9CUM1/mtxICXx0vV4FAXbWlIk3x4vz4alLVWB2XjWpjm57mpMHnxVLeSw0DYIFQXNpNoXTx874FOPk+8Nw8Hne3JRImPp8Q403Vusa/qnUstD7YJCfMEBQVNKo5995Q64YBqitdRlxH8iK1lHcUPxrzl+G9c9SU47uGEsGs9ryEW8OodosVGPOdVf2tJAnY7tqxHjbc6HGwadaPjGySI1yeAQ5U2nLf+8nIT9mw/Lf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJYdguksPEo2xar/I0XhteAjQubkVRT1ojND6dR7BJc=;
 b=BNNCkXuMxu8sHs4jpIGsJPdDZ347nqecC/Coe/P+yAols8NC2biN6+BZ3n0GUTR7hnZ+vsYOqrJFOKBpwrwFwNljyTN/bdwatWX025y5wLN1hZK4WubVD8iDvpgDFArvm9IJbm6FWyDHUhHcb20dtycjJ1A/aLAoTGirH/UWS6o5RBN9D0YIMZvH0ayoScaSgarl4Rm8VI3RWA1Atp62/eJpEja2HpUlbmnZWY9FvtBJx2tltB/QBbA1b4P6aNog/bxk4xXMaO8nPXeIQqaBbjhXUGKV5W8aQ+nycTgKJ7eNi9WzuSaUr4xM43rhS4pBYtpZByeVNespVGgQmIb20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJYdguksPEo2xar/I0XhteAjQubkVRT1ojND6dR7BJc=;
 b=BmEd536K3QmiQCNTD67xGOjrBFOQp4w3ksmuakBHRWXinBBP+qEfDOOr7Ntogc2navtAgDAPKCAsPf9SraXDYoBR+TjVDkXHrVjYmtWrrP98m0H68BRJ8/O0P/oiiYh/GYlMOl6REF139fmoINb6PPRFNQR0JF1wNOdrBtpFzmw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8661.namprd10.prod.outlook.com (2603:10b6:208:581::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 24 Jun
 2025 21:40:28 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 21:40:28 +0000
Date: Tue, 24 Jun 2025 17:40:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] usdt parser: make sure prbmap is cleaned up in case of
 error
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: da37d38a-7ce8-4132-0847-08ddb367bcc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NJQkEmygcOfXSfFIjpwgbwDvtTluxl/llDaP4VjMUcXIjdBa2sPyCfVB8gUz?=
 =?us-ascii?Q?weI+Db7ciaaf4LlgVMKbfg14Fde6mWnc1HCTF7hT+7kbhR+C1S03w1nQL2h6?=
 =?us-ascii?Q?nW3Umzp9t2hUmSMQ/e97UrKfeYOHF3qDkfUl/P6EUNuQw1bRRQuxofoUJi35?=
 =?us-ascii?Q?DDB78Bb16MhrVvLc3Z9LGQGMpSfSPnd0c1t6ftIWSIK3YfacqAJkUkmAJ6ln?=
 =?us-ascii?Q?aIR2rNacErEyRdxo6XOqF+4Lhow/2w/XTxaWrTSaWstmOJDl2NLwiapzOeoq?=
 =?us-ascii?Q?XoVWkdGORGavxrvqtmJcO8IuYoVrEs9hzsKVvwwZj1m2om1muJALp4pwFt+s?=
 =?us-ascii?Q?1v2M4W50mHziIMXoBV8YR4PtaeaakFWSdW5LgyVEZbRpHpZIlTsHEpAy+QrE?=
 =?us-ascii?Q?sYlbDvf+6l94nRJcIKi6C0x6xxyIFAZ25tKdKlLz8aCyjtKVANFzXPu9ni1m?=
 =?us-ascii?Q?UsraqQObZoDvOr4sOC43oTKnMW9bvrGI20MuyBIDFEPYHKkP8PI6SVhYWSlO?=
 =?us-ascii?Q?eZ8XQtKLpBnb/pAmQE/BAiqAuHV8BQVhOKNme7W722jdPvahZ4/2jgi7r+Kt?=
 =?us-ascii?Q?FTUh16G/NeZygZSzafflT1Iyy4LmjSNcNedegCovClU2kt9IA9+GZhrt9ZW2?=
 =?us-ascii?Q?S+Bz2MdJnIMs+CuWgsKTTS+IRYygMmDAxPACsiT10q3OvGTidALwhoY21pm5?=
 =?us-ascii?Q?VrLZT2Qgzb2OyB/e05P9ePlaIMM/nfrhYOT3CyGEJcxcYRU5m0sjRLoGGsTj?=
 =?us-ascii?Q?ElRbi1V7TUvOcUHqNu6Xf25v0HyQE813XF/iEeFrRLk/2aEfx+Y8es27JpGz?=
 =?us-ascii?Q?PErmwFepPskevR+rrV3Hu8AnxW+UjtFb/bhJDA6Rbk2XlYlTrap/SbP9PDOv?=
 =?us-ascii?Q?JWLP0t32W2yU58tPbPH9nAndADouSCxo0X6FpZT010HlLBi2U5I8PW27iYhz?=
 =?us-ascii?Q?zctwEtooCW7t3cwKZZppQmHq7gj4kIGzf6bl+vMmotHGmHPelty5DUoyyZ6G?=
 =?us-ascii?Q?KmFd2rc6mYpuXEV4D1obGOy7tJdk/8tbpb2IQ3AY6jlQ2Az11ZiOWAzzGHmB?=
 =?us-ascii?Q?fNFtWGoMjF5DJ46yCNyHaRTNXrVza4iXEMeeEJuZ+ufAIM8267Hhi+wbw8Rj?=
 =?us-ascii?Q?iax+6fw6uo74L4xmdqQWH0MS+lecqn0iVKOYh+JPSuUUTrW43e/Co+9plCNp?=
 =?us-ascii?Q?jtJswFVUrFNlY/MclS7v9ed+iYLggNataWQ3iBUEEmOLSmFwmi+bEgoHcQSr?=
 =?us-ascii?Q?Jfapxd9pMGMTF16j/nLSMuxSHMXeYBrSQwyKLAkaomiQu611pihzsTSozciU?=
 =?us-ascii?Q?f9GLub3t/0p5Yd+K5X+Vo6mF9u7fuOLHFngpNZN8YkR4A2bq79dYDJUMBLS+?=
 =?us-ascii?Q?jOODsgy0HNpc5HPdKRymBl2wjyeD5SCB6GyKqJ2tcGp08V30oDHqv5W0vOyt?=
 =?us-ascii?Q?K+8KEHz/fVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ac4tgFb46xF5YjV6xWIByNH/kYQTO6Y0v3RpZk21FJFqAk7CUdLlZ9hmUuD?=
 =?us-ascii?Q?aeZq1a3YRCZMT9iVx8Ow0clBXoZIiszLUdp7pYzLaaLN4+faWKtSJYqVJtgT?=
 =?us-ascii?Q?V+Z28090eu1UlHAZ8AaTBvMD4DrdIVg4c6xFrywuL01dVOZbu0hqCGA/Uz2l?=
 =?us-ascii?Q?IMhiIA1/lxzIynCNvBGPUCR6tCbyXzV/s2mMa0RwLzDJAbkbuYcu8L8RwBcg?=
 =?us-ascii?Q?NeWe8lf6s5hkI8xG6coq7ykJonuLL39QKWd5HtSJJjCe2N9AIID0XmZwg1k3?=
 =?us-ascii?Q?mwJFLNfNeYFsiYMl1eXJ6ddBu4RR7SjZOwZnt9UapHUYFPFocEsMzUCT0yK3?=
 =?us-ascii?Q?HUcTq1bCQLrDlE35bkuyTR7I6rrtuxoRwW7kysbcbNw/YcBGVcq4umT+v1UA?=
 =?us-ascii?Q?Kn85vFBfiVXST/jMo3zJLSswHp4qOCAZydyyjf62xMikbfDexbmXMQ3WVZMy?=
 =?us-ascii?Q?DE9qHY1bS4gQCOQi0WArsvQ/VfqmkgPsy3APdLJaZTjuIJMb+JzO4LCOUw8i?=
 =?us-ascii?Q?ghdOSbvseg+jcUYqxUIhFV9jr4M/hQgPJynBBlwfVF2C1X0ZhF4LhfY+fID3?=
 =?us-ascii?Q?/boMpQE7Jc0t6XxUmmZj8colzNl2op9rwsbMHW8lR6hBaQQiaIp94KB204RX?=
 =?us-ascii?Q?GiNS3N9LJwVHMHaJNnmEGjUc43FtMCdskMWIlDV2k1KynoC5Jxm7FneJoUbf?=
 =?us-ascii?Q?IxFfruP7uCqygCvLV6BQIvEixWDhkWvMU6yG1IYiPEYDm2PCtMGtma5En6eH?=
 =?us-ascii?Q?LB4YAJAbFSKVwwloIr5qw6mKxU+B17YNE0wMC9AfI2APdvtrw38OzJvYSFYp?=
 =?us-ascii?Q?J/tExR+H1KXJKOdzfLKYj2F0/SD1bqAxcM2XC3nVmvvP36EN77wb0tXqEyRS?=
 =?us-ascii?Q?QyqMD6nn282NpoofAI7sZLulsCWG2cvsgUvibrMtAjRJqefVCbxah+zJGTjX?=
 =?us-ascii?Q?0OuplvJAkJPh9t7WKf38BLflAPTQzBXTEh3fHqUvKuwaGVWNqdx5+C8IAtVP?=
 =?us-ascii?Q?MXy752sUiD72RdAaw859FDmSTUy6fMLMYvEq+jY3l63UlreNqVVEJ/vhsTbj?=
 =?us-ascii?Q?hzc2unOG1cidRgZT1mFLbgqOkVBqL8Op/yAfwwZGBq/SX2WwmnxldJ2PNI2y?=
 =?us-ascii?Q?zwvfaNan9vDreWAiwANpabeePvJ40cJcaI24EWYD20XZ4apdV61zRfZEbRFv?=
 =?us-ascii?Q?K5adBdZxxbn5ofC7Pe8DPMaMoew9AuQjVZWjzw48gCvDr7051R27tQb7kogO?=
 =?us-ascii?Q?sFHpBy5um/B64Nx6aFxKoju6qW7axKq3d4b91sUGDVMhXDCeGygX5rmzS78e?=
 =?us-ascii?Q?WYjkLVXnocqmHL9devnnM0/4/MafCLiwj87BWw9x+IWh6oy5mshX5xnQhpsj?=
 =?us-ascii?Q?czqAi3RmlFa/9fF9B893ZNcqBY31juXhHiCuC9mS0FcMMY765/rys5Anj+eD?=
 =?us-ascii?Q?2VakFSsHBWx/RgQYfviiPNfGRFzW05oZ7ylTIKQxOu4Ox/9tJfvvfuZZFP3C?=
 =?us-ascii?Q?8Yvwg0Se7UucT1A+7oDMZcGFZvZDLThebMZhXJ8YcD/+RtKshoCLs+GDMtKW?=
 =?us-ascii?Q?tmhHQGYWAw6s8zV7yLfvo83+OV6GRCpNe/a11DxMFBIR3GGp8RgkR2N6Nzm4?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oD4bxqTbXOJSd76rgWxd7BhbhaxWB7l5pNTRSHzis+qI8B7AdY0o9RX6r+o86jPc9QqDKpGsd+TwUTN2NDeBpXAil6raGZeg4lPYTfD37dRs8Y9WvJf7NR3GEeEzAc3eET1ros8pJfUJAqK6nh8oYC2wPh4V8pSz3kL1KjnxYvYg+sNwBBFT6obxEdjxTvc+4w+ZpH7eN0fy9dzT+BCgToXMXt6yBw6eYJWgCdHuEsY5EncSmqf3Tvt7xEtgSBoF6U8pTXTvUEQAqCaaHhWYW8MJJ2vx79k2ouJeC0zA8USpNrjLCVkJksB1ABjuF5AZEf7dWU6KCQ7jR0i8iLLP8tMvWq0vsObI3JDzqpOduAieLV5i/jVtnBTAzeSrgfgDT9W4FUu/l0j+4KfQZFvZJlcc5+FVIK+dG7ZlZPc3LTY7+dj5rJv0T1eVKJ97HU751dLggIjJi07oiVyJKVqzGehmOrCTiynEMO8E1OYR2GtlrVt92sQRNXM6sTnCcsfsloDxkmjRiFu5bwMfEOdWuA3dFk04ZL90Zt0kFtpkjNSmudLrfLBjVannh/YCteBtoIfQ3DrfLGQijobNsRbdvoTF3FExNrSuv25RxxFgwPM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da37d38a-7ce8-4132-0847-08ddb367bcc1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:40:28.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mmz3U5Yhe3l1D3V6vymbSOqZ9LNRTwlHxP7jnut/cXnIPQRSq5wEw2Tp8a1fQ6uExo/fgJ6q7g8ekIoAFigvSIAO8J7txipurkGi1UpgXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240172
X-Proofpoint-ORIG-GUID: 4XXnQUutYdctIESaq-M17I-TgRGRhcoJ
X-Proofpoint-GUID: 4XXnQUutYdctIESaq-M17I-TgRGRhcoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3MiBTYWx0ZWRfXwMgmivsNtSln Sj4m6T2iAhB0I/gk/BPJpp9mLNEyK4C4ucnsHfhRaltJkGVttWnO5Hpu0KQZPw+Z4kCki+JQb5A UDGAPBWtZzXOkwupV8ufxrJe3obuBo886dzFaubQJhEhAdCw4aDX+sZfcwE2FbQE1uZCklARhTt
 VpGUaSZmn1S5TMXkdEgox6adCEwA824tRYutmNExPeo8H6qTKOZDm8LgOVPixOBKWW8TEFEi/4s sZynu1K8LM+ykC9zuNhqT36wjMg2wutJOndgF6LXhc5XkAI6Qgq421C2n5EIlgdbHLRiX8Lgh0Y 9lPdUWoswhN5g7wpMBN8YeaS5bsbpYG8eSxct4vfO/s6OYjV4u+CCt4EOITgiMFmKidVJtpIEDL
 bdWz12eHuLzFH72TzpMSHGTQboFdSpcgq6P3xyBI9Sx5kc6+71KVp43/2kogmyhi+6PBGq+j
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685b1b50 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SJfOT9DMDMLufBhu:21 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tnnhFYKAbIG1Qx06vLEA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index d3d744fb..c98c9fb0 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -829,15 +829,16 @@ usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
 	goto out;
 
 err:
-	rc = -1;
-
-out:
 	/*
-	 * All tracepoint probes in prbmap should have been removed during
-	 * proessing.
+	 * In case of an error, we don't know whether we can allocate iterators
+	 * so we have few options to provide cleanup.  Since cleanup is all we
+	 * do now, we plug the probe cleanup function into the ops for prbmap,
+	 * and let the hashtable destroy function take care of all cleanup.
 	 */
-	assert(dt_htab_entries(prbmap) == 0);
+	prb_htab_ops.del = (htab_del_fn)prb_del_probe;
+	rc = -1;
 
+out:
 	dt_htab_destroy(prvmap);
 	dt_htab_destroy(prbmap);
 
-- 
2.43.5

