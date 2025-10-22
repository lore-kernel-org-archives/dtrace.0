Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956C2652A2
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103412; cv=fail; b=azdYDZ+M88E3f1Oe3ajP71H0VoTdnLdt9OqN/xYD3mprsRg1P6WovwZovUVCK/it40mZRLmMxQC0mYCy53fLjQX4hikIg7AlCh5V0bdzdz4x17hxln8XwlwqhPdb6EWoOu8Nb2iwG+6eeEVKNhF1R0wzV5JlwC5vgwhxOBh1858=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103412; c=relaxed/simple;
	bh=6vfmA81i8WVQICrg45zNKi2XQrjWbraH8xXxReRR3Yg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WV1UQ0m3QjlTOn0lp/3Q4GPlLtguWlOoy0zablYoH+Yh9NTfL3tsg87abck/QjsVgKL3S4rqRhA+aWzH52Wjp19VB1lIpdDoXEBLM2iGlUy/D0zVK/ZtbpX8QFnGyTftGD4exwNCMZYyWhqJOKlaksFpexdWREHMZF4f9RK3960=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rIiwvpIV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JrfKsRQ1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rIiwvpIV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JrfKsRQ1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NQ71022548
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=fqNaoXbCd//CtDchy1
	lu2gqz4XpvHqk0WiHpwdAX7MQ=; b=rIiwvpIVZeWzGvDeE4kpcw6nxCYhyVhpi0
	wYduUZmpw3avAHGH81sHmW54wbsYn+GDSXcMJ5q0PgNd/y4/Qj0TuIb8P6yzFEw+
	JAh4bPF4tJeAWgsnGPxqHkNtXSSQbZtsCMUYy3wM4ipxELBu0qhvkyVFqzCBa8GG
	lLpHwMoCv8iJy5pshIRoCmnwcEfd2VOYJR3cqQgMKkzx/L/6XLZT5GyrrITMPhbM
	VgAK/PJL6TRB8jozjtg5MzYVNcIDyN2Ilu4KhQHtF7WI+HGz3hTVDEXcxC/awZ1/
	YLcLS+6bXONtwHaWLlsIZr78dqLGtNxdN6iGl86vcfaGFP9ndF3Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2vvxtn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBv025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk2PWsjdYaoK3XeU2ncoav/5BsbfpWUtfADZk/fdQ4FT8iwb843+JlkBn5zAA1lsXTzc9nk8sR1mjpA4R1y9/cqsS1iDW06TcAFUYVoo00yKEM1f7qqOiBdQVDZfrhV2CnbGdcvM6AFgM+ceYIfpXXfy4Up4dOat3VktkCIct7Rp/xHu/DU75y0CxGygFV4KJY4vhKeUM9czmEV3bNT9GWax0B1+GtMzkkPxJSUkf+z9OipmwIgdZo/N/1iFhu6lTPUB1Q8zmmP4T2gGQWGmgMFse7AR2yhNgFFcwiLRfjSF0A6mpHDm7eGvNzitUWJHxasuWOG6JQIQGbPkhraxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqNaoXbCd//CtDchy1lu2gqz4XpvHqk0WiHpwdAX7MQ=;
 b=X540xGL9u7Ax99V8/ByrzSmqjfuqUi2bcowbl9y3gE3/I3AT7T7J2PXCpwE64OLGcNRyp8pDm/0e38rfiLwtepCO1/I9Cwg/tFMlzvnbpmOs7+l3t+Qw3dTIMHA6DYv8JfNKeNVXYxeNWIjnEJyvyjteLge1+jf132x6OzDXZRVqaN1zmScoZqUjA+AA2QmcbAQvGr8omNjoDE7uwHIIAfU+vz119OzsRS4/WQMUz7hb1CgDx3VKtDLkLKXsem/FeFBhsfMrTmbXw+vh6PuRyLKOPjrxtJbcvDS3Z7OpUkk4fl7VG8wpS71q8PzBJgDKuonkX/kAharlIUpo2tXsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqNaoXbCd//CtDchy1lu2gqz4XpvHqk0WiHpwdAX7MQ=;
 b=JrfKsRQ1T7McIEERysy95l6ZLCQweDCMqoJXyM2eHI0cNgnh37xEcWJpLHqy42lxPA2d60i90elvZ3PRP8Ra62Fd0doeGimDwQVeoW8b2J5hjsBLBey875p27Cy0UU1xuVx+y41S+n1fDYLHDL1Zw4bsfyLOJPE0FB01sOlqr9M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 17/20] doc: Add IP provider documentation
Date: Tue, 21 Oct 2025 23:22:47 -0400
Message-Id: <20251022032251.2010-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:510:339::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e91b55-d99f-40a8-a7ba-08de111a56e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REqPcWcuuenSy/iyJ6HeZ93hSu99uoiK4RF5BQUnZMw35eodiPFm3/230ugm?=
 =?us-ascii?Q?E+Cxa8fnECNP+hLyd3MlVcQW7Ag5OM5AZ/IWnggFw5uGhEHNIwezJc/uMwue?=
 =?us-ascii?Q?/OkzehiBZA4bRIUvtSVLWEqrWonEXrlXutwbbGY6lmwxOVumHWcSGd3RUPji?=
 =?us-ascii?Q?R0XExu6LDWldFiedkiQHRG9BKaUYEW4NEOnJoFtA45VksqHj+IGqyZnSJn4D?=
 =?us-ascii?Q?wsBAlk9ooxHRL5wUuTtLBw7QAbfQMQ83YZ4OoMbEyg23Ynua2h5AMXlDdwDt?=
 =?us-ascii?Q?EwyXjdQ/HF3m3/DGyIe1d4EqPJhUieMwOcVX9zOaSZ3I8Pkk7jLjo8PBVYXT?=
 =?us-ascii?Q?rwM4gYaNM9RUtUB03wJgBaC6nIil/KrfIw/l6MHCt40mD5BjAFCXk3uFXu3r?=
 =?us-ascii?Q?+SW5BLX4gbfczMAX8FnEMAiHFb1Sl2Vh8zjo70PcAMWCAslCCNsv5yshl84t?=
 =?us-ascii?Q?F4/to+kDvpUZ0Zz75dmGO0maN520Zn/xaVbhysQSO7HYHMwyEsRl1/ahGwVm?=
 =?us-ascii?Q?i9cxz+0ftHX0g5Nb5OkY9VjIGl1myQMjVDZarte2uhnlho3/xdCaZWus12Et?=
 =?us-ascii?Q?k0SGH2GnluE+okE2do0blRDYjHNj3JjGBNozoG/AFTBg3NxJKoBS5DVhTxX7?=
 =?us-ascii?Q?Chm6iviYFN0DCXEwnT3dnYYAZDmlcf4Ya278ERI04tfesio8dnDTpwrbm15h?=
 =?us-ascii?Q?oktdxFrxXGUs9N6+59Iz7WHNkMLa6X2z/l2kCa8zoWVYIDNhiTPQNvp6HIU+?=
 =?us-ascii?Q?sSB9N9syj7Bs5udxoS0JfLb59p/L97wb2MZmjx8hIyMuMjwi+8phOcRjj8t+?=
 =?us-ascii?Q?ajY/KUqa7vwqYiQM/axRynFVMr9vQ3635vb40N8rIUnIKxFcFtOd7RBsB8dB?=
 =?us-ascii?Q?RlUc9aFZv0Mh3fRbFMsuq/A17JEO3wvFdFl3ZgS9RpPAIugJcDZQkaR8VBOl?=
 =?us-ascii?Q?knEMr2BaWJU2QZdgo+JGBirXNMma/dgU4QDAQbb+QQmsDAMW/MfSx0DxE1oM?=
 =?us-ascii?Q?ylHrxoXlQfmX8dVGNDqX1kbxeMdpoHX2OrIcOMDfLi04OVoOL1+LElcmJijJ?=
 =?us-ascii?Q?0AjerFubFTyRR28+oD9Wu7w8rDkA5mNpfRN+346v6M6LLuB36kTR2hHV6hRz?=
 =?us-ascii?Q?TdbiBGJmxP6WbJRbSVXwJJDRBtK6l0vXe2Ae5CEpPhp8rQDeWRIzJJpGgUKx?=
 =?us-ascii?Q?DzV1imeIcrF3tkYLV0+ItFnopkokFMMGbNwV5R2+s1AFoZYmDHTuhc1itsmH?=
 =?us-ascii?Q?CIfn/Q/J3SchCWKJ6O81W9/El54V2OPi1ZVGCU8lWsmuCBtJxapdLbnqIvt2?=
 =?us-ascii?Q?Zji9Ll7P0RGhO58sgpzmCcKL4KGDqYmYBER2zsRj9C7pn8+fV+2owdPANpSZ?=
 =?us-ascii?Q?5AK7JnSuycbziZP3xYxZPi6SmYYMevVAiO05SSlLJmgn/MwV1APiI2cgHrFG?=
 =?us-ascii?Q?zwixQnyQKGr/4GLPo649kAat8vQRiFxn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t5FsHaVO4lXOkycheZZkxEUHlPj3gFaQg2ZbyIfnVO7iadrO62aioUYZYMIZ?=
 =?us-ascii?Q?3kbYkZa5zryhjRTJnhAkYRiXjoyWeCk5cUlBMVi7boJ4pS7Kn/dkuw9tFLvT?=
 =?us-ascii?Q?aTszkbfw2AqmvNG3sc9lw6VmvMOD+qgT9W1Qxb+ESM8ylYJoTqr+gErK1K/y?=
 =?us-ascii?Q?5BYx1Zx4IGO08rw/Tht2AVqscJm2jnVakjd0xgB4VpVq+hM1dis8NPE8FT0J?=
 =?us-ascii?Q?6criNod/XIrC2gnk22Icdsku96ZUYZpBru5welhcHKw2dSuFx0GHG//TXP4u?=
 =?us-ascii?Q?cozh32LMV3+tyzwiDpYpU9llXXcD0pawOwWrFOQIapMwOmDPeI0YMuvdlPML?=
 =?us-ascii?Q?VumN5GUMs6eoTEDFDQnhM0P19kCJgRw9mV1jwpP6nXJx+dQVMuS0QmXg+3Xx?=
 =?us-ascii?Q?qDgkmUwQ0hcGhh+3/zEy/bph0FzUl4wYPFPTJtqHQ6jOqqoCTCFI4vPMJC5T?=
 =?us-ascii?Q?rT5cIoyhLEYZ4kjHalYW4Nx0v3MkRs2nnOIj5HghmiaFCya5iwaQP03p6/ou?=
 =?us-ascii?Q?ajxZCyIh0E5w9+IoDlYl/kDlxhymH8qvT6PMYKy68X6K2390CPbg6A/9LaH6?=
 =?us-ascii?Q?MM/0T9UZmNMavCKyqQXtfeLIxbSnXA2rg9tTV758Qd9fq6UO2JADacNY2NSO?=
 =?us-ascii?Q?vD7tlW78xssTsSLrYunYKOugy6GSi8H84iADNF55Fn2H1iLCx26UJDb7JVTH?=
 =?us-ascii?Q?OL6fb8hvfhMS5JWp2lfgZ7ymIiA95ypX6k8Xe+XDX5yfvFSxhhVqLSdrFmUR?=
 =?us-ascii?Q?Knjm+OPE6MWG5PZ2nleqmJngczvBOjl3uMQXl77xXJ02HwOBveSzkUkubve4?=
 =?us-ascii?Q?mOAWB84IzYuEfxUxSrqUEUUPdfYYtdehBLV2Uh05jaPTtJ+FuNXdZjkwNXps?=
 =?us-ascii?Q?1qXxQQQybyNYrLS+z/nuu3B0JDH4eVBE1eu4CuW/dOgznj60eDe1CaMmrWrI?=
 =?us-ascii?Q?wr2MkanUub4enSxIQbRs4w5qOBF5Ideq0S/G2G/n85x/Qv5wKMVLG7MK77e4?=
 =?us-ascii?Q?AcqqpaGcWozPINNuEQzKK6+y4Y+cmW1wY/cemrkftKuXx8RUaUE2DvQguKly?=
 =?us-ascii?Q?5ed5tAY36MdOA005rrG66JiJ7ED2garMnliAopZZE3ZE1+D3yMSDj63JsvQ6?=
 =?us-ascii?Q?OgADw/5tgc9eW6+ydHtp1vF0JhkcjAxKkkBswJ+sXwEs0goVv0d7uq+MoB8U?=
 =?us-ascii?Q?HycDOxc6CiVjdySpP3bc7Y92zA7w0mJU83fgqkp/syDl6NHXLIuN3B+bUF+D?=
 =?us-ascii?Q?mnQCPYuGZ60DjVh/m3W5tqbZdf6RED/3ojPHrCG9i+ZViWetXpqIkLPhYaNa?=
 =?us-ascii?Q?3iEBjfUt6aoSjfKw1EttGrObljuQw4R1N8eyhh1zErYdgtqnCwyIOv3tFDiz?=
 =?us-ascii?Q?zeSEi0raKK7Zon48UsZvoUzWkp5NoU6/G5iv2SXb9GfJzq3XYMXqGJQ2acmW?=
 =?us-ascii?Q?Bnclrt2G7Ntnp02yNQpY4A6Tv8qa/MfgxIwTPQ7Utf5drbq0LgfvTOILOtui?=
 =?us-ascii?Q?vXLzxSjQmLQKNJzwP65vDLUx4f/WsNuk7UCp0MdDF7EI0oxtr+c7EqaOE1Xm?=
 =?us-ascii?Q?0pPdSYTxUJWM6q8bE5ipShlWw5eK1zI7bBl2g3Lx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vGbG4sQk1ep+yJd5QEQ0OQ6vM+ufvEKYe3SQoavL4wmRxRbEsudAqHEek2KEYQcq+XbxsGah76uwogHfEQN687R5cytE+0yj805Rah3YqrkLkGcxWB+UQntcnrwWl3Z1HrJnzP0kgAvAXlWy0Z/P0i+IYeHCYzyqrtPSGaIgKSeNUAQX35fgFk5RG4r8hU63adaRKvCTwATyX5iYSvYVD5Dbf/5FOov6RfO0em1TXqhj4UW5o3xvG+Lc1bpj3IZd9OeUygxgp9Y/K7jvAqf+REdVNYMS8mv348k61B4PYfQfB5bnhjf0K2cavT0d0IfyeUJC/E8aGlGQfcVLRnOt5DKcDPDG9o5PffDiwt1H2QQ3hBEupCpm8w94d2BnN/LeTVtBkZ9RgqHj7XI4nHgOxzdX2GaYetxD85t+pyXLV1MsstZKm0sbHuOkNweSTcyg2OMNi/leBgN+tKf/SBqOwC8nZzZBTH8DWeCTyNqZJHJNFfuUvMMGGD/SqvX+HFhPNqEy1pwWtfGPxpz1usQhFu3Ogp3maC7MWiZZaPcUTYOxl6720yMW4CujQVX4xpo/7kkHtL/xpAYpUJw0ZaNeP+ngXPkJXFw44Y/8e97mt6s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e91b55-d99f-40a8-a7ba-08de111a56e7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:16.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8TAqGhyYPn33LZhWIoUkU+C87VkHXi+sHDLMrjrofer10SUGoSGgYgZ2tx/eWJEIwcJ8s7fVsmqvphPESf/FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXwfsS7EqKuvn/
 mM23woReQnsC0z24TJq/QY9N63FlYFxCv2cYNdMRlMdCKhzKF6gCUhrDtRCZBV0OMSMmtSlf8zr
 ZC4jLcdnh02HMWX4IT49oIDK03tfm3iydo3aIEJ1kyTYAFPlpmWJrjiDxgHRgPklUXzDjahNWT4
 WC0JnjTca5wcGPpCiQntNpin8T+xzT9XwKY3Oz257c9pthZWaLMDKvHiidM7y9JLBRKhPfyvDeg
 PcrLKdX/xBZXa+bkQ2CgLWpMyuatw3JyQzdyf4r2Jj/K0A18t9VUmUpEFlVdl5GCwtxhRLQWrmp
 W8hKGxz6Sx/q4dS1z46uxNMM0oKlz1GE4thLt0NVAaFwXFVqbWcncopsCc5D4UgDli1XadiCqDI
 QdO49CwKCAsJgrhXAvax/F2sSDz97w==
X-Proofpoint-ORIG-GUID: W7Nmge1j8XWR_W_pG95ETN2M8WaDMobl
X-Proofpoint-GUID: W7Nmge1j8XWR_W_pG95ETN2M8WaDMobl
X-Authority-Analysis: v=2.4 cv=FuwIPmrq c=1 sm=1 tr=0 ts=68f84e30 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=9C9IiEIpXZVybtazt6oA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
 doc/userguide/index.md                        |  10 +
 doc/userguide/reference/dtrace_providers.md   |   2 +
 .../reference/dtrace_providers_ip.md          | 173 ++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_ip.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index ef1489f5e..063881c6d 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -208,6 +208,16 @@
             -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
         -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
         -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
+    -   [IP Provider](reference/dtrace_providers_ip.md)
+        -   [ip Probes](reference/dtrace_providers_ip.md#dt_ref_ipprobes_prov)
+        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#dt_ref_ipargs_prov)
+            -   [pktinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ippkt_prov)
+            -   [csinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipcs_prov)
+            -   [ipinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipip_prov)
+            -   [ifinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipif_prov)
+            -   [ipv4info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv4_prov)
+            -   [ipv6info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv6_prov)
+        -   [ip Stability](reference/dtrace_providers_ip.md#dt_ref_ipstab_prov)
     -   [Lockstat Provider](reference/dtrace_providers_lockstat.md#dt_ref_lockstat_prov)
         -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
         -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 70fcb583f..a225f4486 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
 -   **[IO Provider](../reference/dtrace_providers_io.md)**
 The `io` provider makes available probes that relate to data input and output.
+-   **[IP Provider](../reference/dtrace_providers_ip.md)**
+The `ip` provider provides probes that can be used to study IP traffic.
 -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
 -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
new file mode 100644
index 000000000..0630e577a
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_ip.md
@@ -0,0 +1,173 @@
+# IP Provider
+
+The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## ip Probes <a id="dt_ref_ipprobes_prov">
+
+The `ip` provider provides one probe for IP sends and another for IP receives.
+The module name is always `vmlinux` and the function name is empty.
+
+## ip Probe Arguments <a id="dt_ref_ipargs_prov">
+
+The following table lists the argument types for both the `send` and `receive` probes.
+
+| arg       | type            |
+| :---      | :---            |
+| `args[0]` | `pktinfo_t *`   |
+| `args[1]` | `csinfo_t *`    |
+| `args[2]` | `ipinfo_t *`    |
+| `args[3]` | `ifinfo_t *`    |
+| `args[4]` | `ipv4info_t *`  |
+| `args[5]` | `ipv6sinfo_t *` |
+
+### pktinfo\_t <a id="dt_ref_ippkt_prov">
+
+The `pktinfo_t` structure is an abstraction that describes a packet.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `pktinfo_t` is as follows:
+
+```nocopybutton
+typedef struct pktinfo {
+        uintptr_t pkt_addr;
+} pktinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
+
+### csinfo\_t <a id="dt_ref_ipcs_prov">
+
+The `csinfo_t` structure is an abstraction that describes connection state.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `csinfo_t` is as follows:
+
+```nocopybutton
+typedef struct csinfo {
+	uintptr_t	cs_addr;
+	uint64_t	cs_cid;
+} csinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `csinfo_t` from the `struct sock *`.
+
+### ipinfo\_t <a id="dt_ref_ipip_prov">
+
+The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ipinfo {
+        uint8_t ip_ver;         /* IP version (4, 6) */
+        uint32_t ip_plength;    /* payload length */
+        string ip_saddr;        /* source address */
+        string ip_daddr;        /* destination address */
+} ipinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipinfo_t` from, variously,
+`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
+
+### ifinfo\_t <a id="dt_ref_ipif_prov">
+
+The `ifinfo_t` structure contains network interface info.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ifinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ifinfo {
+        string if_name;            /* interface name */
+        int8_t if_local;           /* is delivered locally */
+        netstackid_t if_ipstack;   /* netns pointer on Linux */
+        uintptr_t if_addr;         /* pointer to raw struct net_device */
+} ifinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
+
+### ipv4info\_t <a id="dt_ref_ipipv4_prov">
+
+The `ipv4info_t` structure is translated version of the IPv4 header
+(with raw pointer).
+These values are NULL if the packet is not IPv4.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv4info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv4info {
+        uint8_t ipv4_ver;               /* IP version (4) */
+        uint8_t ipv4_ihl;               /* header length, bytes */
+        uint8_t ipv4_tos;               /* type of service field */
+        uint16_t ipv4_length;           /* length (header + payload) */
+        uint16_t ipv4_ident;            /* identification */
+        uint8_t ipv4_flags;             /* IP flags */
+        uint16_t ipv4_offset;           /* fragment offset */
+        uint8_t ipv4_ttl;               /* time to live */
+        uint8_t ipv4_protocol;          /* next level protocol */
+        string ipv4_protostr;           /* next level protocol, as string */
+        uint16_t ipv4_checksum;         /* header checksum */
+        ipaddr_t ipv4_src;              /* source address */
+        ipaddr_t ipv4_dst;              /* destination address */
+        string ipv4_saddr;              /* source address, string */
+        string ipv4_daddr;              /* destination address, string */
+        struct iphdr *ipv4_hdr;         /* pointer to raw header */
+} ipv4info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
+
+### ipv6info\_t <a id="dt_ref_ipipv6_prov">
+
+The `ipv6info_t` structure is translated version of the IPv6 header
+(with raw pointer).
+These values are NULL if the packet is not IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv6info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv6info {
+        uint8_t ipv6_ver;               /* IP version (6) */
+        uint8_t ipv6_tclass;            /* traffic class */
+        uint32_t ipv6_flow;             /* flow label */
+        uint16_t ipv6_plen;             /* payload length */
+        uint8_t ipv6_nexthdr;           /* next header protocol */
+        string ipv6_nextstr;            /* next header protocol, as string */
+        uint8_t ipv6_hlim;              /* hop limit */
+        in6_addr_t *ipv6_src;           /* source address */
+        in6_addr_t *ipv6_dst;           /* destination address */
+        string ipv6_saddr;              /* source address, string */
+        string ipv6_daddr;              /* destination address, string */
+        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
+} ipv6info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
+
+## ip Stability <a id="dt_ref_ipstab_prov">
+
+The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
-- 
2.47.3

