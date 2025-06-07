Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC71E98E6
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276909; cv=fail; b=IfY7jyTfEbxYwsIOheY4gwCulvDyzZjdLEu4sIkzV+kCseoSD+mEIuXuXsA14VzXbzbGVuMpvljPWyhQwpobeHgWPmw6K5SwZ8V4FLwmKa1CKUUvU4UY7WFFBYM5uNAB3kw5YixcRA/auuSJgl+3ghv3UEptVWpknLOx39bTbV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276909; c=relaxed/simple;
	bh=ujdDs1mEzKjlrZ0ireZ8iEdAw4dHO2kWR7G21ORcZFc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ce2Ewf9zRGLTwkqfa4NXYX1cjmMpEy/PYyHLfKbOeyFommUpRWvaH89ZxKjJ4KU0FPxFCrnQYGbWVoxqH7o5I9igu6zkSnrMa4RMwCdm/SKJ1oNEKnad6mThaG/pcIbKIwkkzEIfiS1s2lbovqfQB+krlfMbzZpf3dZ6WGMkI6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n+xVTM9U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vTS2ahgI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n+xVTM9U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vTS2ahgI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575avTA018048
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DtCIt1KzuK81MwmBefjm5klQbizdwWVx9Sb/65YR7lw=; b=
	n+xVTM9U3sen7SvuO14lCjI5/OIXDqF5T7F0FCescs+RRU3F106Ii/T+79LCLDyy
	uAqz6Szo6jgOqrZ60TH/mxw+1BX222ppcGO0SF9n4cClbllot/EJwcNctw+/N3U+
	N8lUr3eCR0BYbwbi9q5M84Y4gEtVQ+CM4uPk03TEM8pz10wmAoZjf5iVkZn22glI
	weadNd2rPdhJe4sDIFNZo49bXVmWs5ODr1Xq3nHjNpAuOE2Xg5gM3KbKDAXtNtdg
	MVlagAu6yJ19pl8oygz4rmEm2tS+0vMcL2BZn6HT0o76FEmr5urEwyi4YiU2HpHn
	50OO0eWok6Ko8MMyhU21rg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad025h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55765vNN003191
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:05 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uyqr-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDRQJcPev/i2M91dJFNCRY1I4oOcJi/G87sd/7GRkdUlpEcD62jPeX2ONKutZFQUkMh1DRFJsLdhj8WH77QjUnUIpGv61caoPS1E0rWzbnaKLP4mjX13XeRJvbHHxlz1aQN6mvowD4h1ufowvmYYzqR3gEXnIJP2+bXn8MTJ5jwtIRSC99lUaXkYd58waHZKsyY00kqwaRtad2ajNbDM0S3usS+a6Tx8kdaEMxhtTafE/JNPaxJglMqevDnmaGRaTInQzOwJJkHYHCZPU3h2SoOOJYiazOP67GpkF6J3GqDruPQfVnMkZxa+C9fk8GLtgiW0gP8elIwCUS949/clqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtCIt1KzuK81MwmBefjm5klQbizdwWVx9Sb/65YR7lw=;
 b=NA+JFI53f50QwqGp6ixqEg8tA2gdvtYSv+XQDAflkvkdoll2s/rFMOhawO10uxt3KacVMmX4dGxOZ1fJcccaOj7xAEvMHOq0Q9FcZvX0saYXyOABxMjjqEV7/WMq/WbeSO7ntOx85vKaj+xWXDa5v+XYPUP454PwAfMAyH/DJWU2KgHz9Zw2Gpu8LnCXkZtFewIihZuaRu5U5YKVXSQTai6DPkb1JkJqxdGCMADjOGB975ssu/NnwqrI6kdR28UC/8O44pFUqFZVAfX94i3EUY8qPMeEHaQ1EDzoRv/U0v9c2Rnsdkt1BuOX5uW+lwxqfo4hwLi30qkkT1/v1qWnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtCIt1KzuK81MwmBefjm5klQbizdwWVx9Sb/65YR7lw=;
 b=vTS2ahgI7j3EnKCdNBTOThXvq9ywRDwPh6MBtfd7j6oZVtmA8QPSsfJdzNHrqUhV5VBQbdwPkzl0+mkPNEv6b7ABUxSSSY5T8vDukLTMfpLMifApUX7Orquf6+40td3IY7k/woTPflC8dUa8sHtJ71S+DF1OPW7XCrkDRNeWLWc=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:04 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:04 +0000
Date: Sat, 07 Jun 2025 02:15:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/17] dtprobed: make sure that retry one time means exactly
 that
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83749DB4A1B2117E28EC16A2C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 43680512-c7c4-482d-661f-08dda58aa468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?byLKGFWwneGpbvYY9T2ojgxjYyx3+r5w7qCXGy4e59sWU7uduvp+Ktkf+it5?=
 =?us-ascii?Q?w2kGbCKAYbo/RYTeTeDuQNunByn4dVBCkWDVyiYYXjVqEPLngBDb53mOo3E3?=
 =?us-ascii?Q?wckBN8oEugw/h2zLPvbGGxlzA+bOXw59aX4UWQi8JzWW4dkm4zKGMS9wKd7g?=
 =?us-ascii?Q?ISkOg0khkhs6fdlTmtnl7HrDDja96Y28kyIj+e9lIzU0q33A6vVt6U/i/x45?=
 =?us-ascii?Q?ClCLFe4mJz3Kbj0/4pEa/QrgreN1PTAwzZTazJU32p/NgaNQOaBq6wQWIreh?=
 =?us-ascii?Q?uTAa8rHXz5TJH7cPqvme72oMZYX1QQnizGtkPiRlNwyEifkhFIajm7fRMN3y?=
 =?us-ascii?Q?BHetPjVm871xhngszY+eMU17YQt6OyOzHEEq/+aLyacXJpKmxtLtRljbCXbs?=
 =?us-ascii?Q?a0J/zUxUHhtZnluad5aSnM8T4GWSaWZwLi3cFACwVM0eC5tm7xzjyC7xCHG7?=
 =?us-ascii?Q?+8GZPTSkC/IGZFC2dlcyk9UPKR0hfgq46ZwfQJ6z6ReiBtkVcwv10QeRDNEy?=
 =?us-ascii?Q?Z4MLGR22N+mfWZGguGjmUQKxTpEEsWh8bg4qQ5hSB7jkMaPqYHE+DITxnuv3?=
 =?us-ascii?Q?Z2CZ/xQVw1vCEmihgq+PRxbMgKZiT7sQZATVyqJfvZIngGoC058MncXA+rJY?=
 =?us-ascii?Q?EN+yq0+BMCCCEtfy5H+x+WQ9hWBFF/u2UMXmSJk19aPBg6Tckhvh/uoscU1F?=
 =?us-ascii?Q?gDCASQd0YVZg9vAk9VAUEjVd/E5BcbIwbg8rh4NG/31I4D9GF/P5OAkP7RRx?=
 =?us-ascii?Q?K9u7noX7wgKsQ8lkYnPHekaVQABoD6N5lAJy7PiR8W127EshhGICf7y6RsKL?=
 =?us-ascii?Q?CIQunaM2Xwm4pI3GXgAzOU6wxX0oO9B8JP3lXrqZcn1T3G5VX8Cn+g/hiBg3?=
 =?us-ascii?Q?LqV4JIeHTp+eA+bPa/MGfNla7LoHTD02IkumKJyjGszUGWa0BA2Ygy10nRhP?=
 =?us-ascii?Q?tj7kma1QGlWv4oNkArNFYyqi6Pi+HwUANroDcFh0H5plKuy8dwWuIEShBWSw?=
 =?us-ascii?Q?GNhmIv2aNOhxVE5sn+mm8wPMeU1kaMez3Y3h2bh9Z7AX11oMEJDhZ5qwINHv?=
 =?us-ascii?Q?kfC1lXr0t2tNRqER4gblqYOsZq43PQSfQyqNHuGnOYxIN5hJNRGMCCiQCP4b?=
 =?us-ascii?Q?llWnL2nEKb7g034h0047v4dYKSIeJnVOWLbSkUUL4bOOLHbqLMURv0ghudin?=
 =?us-ascii?Q?AIxUWvoq/6U/S7p30trnofbZGi+FJEHFO54xJ77uORvL9VEeNa5mr/7vyEyG?=
 =?us-ascii?Q?FQhBQUr2dLM0r4ByswQrM9ysbbch0hwIYl0MotvBqtJaO+Ygxmab8suv9whF?=
 =?us-ascii?Q?bQtgTnJ38OQ4S3St7c5kq8YgZCrxDvdxrSsTacoQE5M9TTeWEMvtjqx5vAxL?=
 =?us-ascii?Q?7ckM3AcdBPARebyZN60ZFm++0RXJ5pPwmRDeXo0JytXsK02XbBh4YeHyqirw?=
 =?us-ascii?Q?hxAoBE8wRzY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M4F1va3qfuYjYQjGX+lFzhl1mNo81Vm3VG9i+wHIHxLvrW0KPcJoiCDAqrdW?=
 =?us-ascii?Q?qyW8pe7UM1NeDopNFjV/PpoS4tqUIhTRyZiRq3zXhNx8YYNlu0UANOQhOfft?=
 =?us-ascii?Q?dzYJsCQzNNGiHe0Vjc5cTHMMVF0gHoE6kxW6tJPjnwwoegU5CNfb7qFbdQ0z?=
 =?us-ascii?Q?UnWaPUE5HO1hW5pD3iwWh56hP7E27y8nY1m6D8dFzfbjIluqUET7Y+GJLwFS?=
 =?us-ascii?Q?F4WFpQJ19L4zNt0E3oayvgu0NvpDksTExbzhTQZKGK7t50+/efroziwnr5Qc?=
 =?us-ascii?Q?OdkY+Nt2U1rIomT88eSl9e4vDQYPEgMDEyOf106NU3+aG0C33/cnNjEYhjxJ?=
 =?us-ascii?Q?U5/D3TAweQusonG8f358hU9T4Rv5SsS2rZxNejrQze7eJqV/dwDRlHtLvpM6?=
 =?us-ascii?Q?KCv6NqgTBZ0iQy5VqdDJcyYBRVcDcfKBI8vE1IcZsph4CoQMU8UUbfRYBfCk?=
 =?us-ascii?Q?O8M96sfO41uC/yCl9MQNKW7inxrMnX4jk0sbP6D2eQTyDGqBn7YGwXVA9IKF?=
 =?us-ascii?Q?Hzw3zE99CNb8QRsgqyml0WBcchZAAPibmQTO4nXbZ2TRaMDPEmsvcBFCADIu?=
 =?us-ascii?Q?YERUGh9NoFd3QZWO8A1cEDwW3Z+tZMYMQpFPM5v7Qu3OmPW0K5VMvbFnCnxZ?=
 =?us-ascii?Q?L0dCxay1DRD6M4VG0cAzcVFBmXhucInUq7bXAX29Uhq4FHUxYPT+jO6Ybyl7?=
 =?us-ascii?Q?bsEN86SVZazREHmsmLeY5RPi8w/dTmVKKioJVBqNpDjebUPsfKr4X/IJDO2z?=
 =?us-ascii?Q?NUDsOevvVhXDDA8jU/4e0SkVR2nVlZqvSD4hMigQcvcPBVgxaBAfJgXloh5B?=
 =?us-ascii?Q?Mhkpi8f/SSZHOqIYogFhQmPGaZh0XlMfd0BnP5i3yRknr5JRuSDowciQsBWr?=
 =?us-ascii?Q?MMJIGpiw/KmdiYDn3TUXbWN5/lSqq7xHU7viz8LLyB++lkyrVNXG2Oc2VE9c?=
 =?us-ascii?Q?wCH4x7GwVumM8OtUxBOekzU6hZv0FkPnCe+djd2c02JdCcwsxarZePKhLEj4?=
 =?us-ascii?Q?hbG+VZHfc5rQ1DwTlvvw0LgRB1wOnPh71iI6NZx7/5gRPkMHi8NWY+Jk3rKq?=
 =?us-ascii?Q?iQwwQaE/sKThTrOO/TPG/3zRa+haDf4EP9K+L5MM3M4I+e4fFONUCu12o6N3?=
 =?us-ascii?Q?KgBfRR79h0tQgCTv2bUhWbL6keoU7EtVZapNQhMUGKzzTliHxhrvr4kImOv0?=
 =?us-ascii?Q?oTBRRHWsRxV5sTfP/AvHkZDskGpT/vCI8avYFCrJni5jkFLiHq6Mwey1V4ow?=
 =?us-ascii?Q?Rfg5aQYDHWolTzZkSkNbnUjkQv9K617rHxuPu+Fkj9E/W45+k4tXLz1Zszdk?=
 =?us-ascii?Q?sxcrebxnERTc+zgVca2krkj+4WpWhmAhwYRGu70ki9GJKa1iHlCRXIBieD1F?=
 =?us-ascii?Q?UV/YXBDENS/N3CNd93PBmlGv7wUSiY357m9kFiUxN4CtP7KcHtBVRdyyyyOv?=
 =?us-ascii?Q?WpqFAaSsePco58FvJDSWxGmRR7FboMdoDQpNDdZ3Z5DXdGywXtD1jcDqSY8C?=
 =?us-ascii?Q?EPVrparKcFQWEQ74MIKuiLrlq7ZN9I5CUHMky2MspGj4aQHRpPUjqBv5aOIW?=
 =?us-ascii?Q?ceYEoxkZQQtQE24HA3sWhSeKgAdLR59EokyAMxlJ6NyZy3xfmdZa7buD+oI4?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Miyu9YzkAUe5PDLGMmMX/O4naCOgFml7y/36GYM97sQ4S6EH7uwCvRWv7kn6j8zJYcZgvg/efO1taG5gZGtBBXPKcr5z3RCsWAKE3kwk4bW+189IpvO2IhcqeJIcFZc9YYMGLRBRyLyvk8mba1LNQf2CPfCyX3DD45oWYXyg7C3cbJd/D5m5zLvzcwxV0rJARWmEQm3gSmYGoDxRUDKSzpwbRyO6nvtjh8PdQ1UIBdFGPPkm+Ie5J439sEYNscHRSquEPhF3BgUfdVmMnM4eQOQvObPg/wenCYFVmW4aoNCbX4fMR42kH+Ea4KO/OIaIrEskHcyEb7B28i3yS65aBAb5fsXbPrnIoidDkMLxQxpQk0LWkaPtoDKr1ZR0Gb/ZWUro/t33KgO7DNGczAfWlnr6cc8mTTBGK1qYOqyihoUHNXA555+3hm4KW64a3NTPB7zx1oE4qKz+zoD7EVV4loAbjqgHWP9RujROtbkeyM9bltKei7+vwaO9vbSWi6gj0zc7uY95TbaOHMYdp3yXaTM471HGqugaWiOBkjssg5vkJb5hOufOc/wO/BJbB0M9prff9Qa9WdUoNbWaZjTX/XD4Gv86jBbUGpwCjRvz05Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43680512-c7c4-482d-661f-08dda58aa468
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:03.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9EGraw4DkzZe5qJz3x+aUwtnUVtALrOCSPz/0TXxfpXnDQsdNsHyqCkAh43aywSmGFfcEAiWES+7436Uf4IlcvlqYG16yVMcZ+SZLCuSgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: rN13omKDHLH0y2iArQmZ4wq5ufDRX_aq
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8ea b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jm9DDgzPlykzZtqn9u8A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX3Tv702bE2Wim xWhjRytYPtoYYppDxcq05xK4XczCzPLG/XXsyRWuEhLQMbfscTE5zPR76l29N4skV5CHpjbBRkw 2AWfXG6UrUdjy8bFIicF0L2MJOe7EtuXZRjKxyhlPD3M6OBFpV9D0HrBSRSuyTMIzZsjwN0TCZ9
 qxwd51iVfVZIKroE5Pw01Y1j4hAlLA0Qv0SH44dSodFYjNwNjPHKYZ+VdL5WqNSZ9YksnnLwFU/ 3cWYuMATfgZEX7CD6YwNxj3Txo2DN5hYt/fX43a0Ve2FbLtrXhmqHD0vsm2KczQpDqqVim1Wee3 Hh34xejl7GSZzFnxF4XNCTmEEg30Uw9n4IT7CzUmtsrVnTCIxxfpZHiETozqYusgCpN9Ldl96Gg
 XiI3/EHBg6MKSSoX8OyW5zNkTdN+8oTYttcTh8xVvUJNBHibSKONU+o4Vo68BIJGD8CTz1Ad
X-Proofpoint-GUID: rN13omKDHLH0y2iArQmZ4wq5ufDRX_aq

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index de15e546..b5c015ac 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -771,7 +771,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		errmsg = "parsed DOF read failed";
 		provider = usdt_read(pid, in);
 		if (!provider) {
-			if (tries++ > 1)
+			if (tries++ > 0)
 				goto err;
 			/*
 			 * Tidying reopens the parser in and out pipes: catch
-- 
2.45.2

