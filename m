Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445782D5C91
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479621; cv=fail; b=Nb5FTpBK29KMjoJLbkPkLYC+92ggdx4OEZCIhhO89TwEpzmmulNqdtYY/qN6WIegnnRc8SzwH8FBJtaPM1soMU+unaw9LJ8qkdaJC+abFL6hz2yWa3wGkT3aSOSnNibvC7MIvvTe55EOt7WhiX6cm2u5pCOuVbj2ZnWtf6feW6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479621; c=relaxed/simple;
	bh=M6/JoRHIPLgVF8vHz/TknHcGhtmqopZCB5cu4yLSTlw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gg7ABUhfRhx3VSGonjwbaDb4ZgS/cjkLfFRNEyOpSUXhqH3tj+xu7m8+6AjKh6XxkNc3ZNrXprZ43yQa9T4yKHBRQRQL7zpMyzIwV11RfAfZItSec81dxbcgcxW4AqWSapaQ3JcrhjorfroRtd1hXQolAjdMuaMZpxpt1C7MJlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e0St0A9X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ECTmW9No; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e0St0A9X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ECTmW9No"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBG5ZLT1685542
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=fubArn1F4YGv9BXfro
	h4SUuSQUOemcGjgpz3eWwT/Ys=; b=e0St0A9Xdlk9oC9zxxhgkPFfmbIl4v4HR2
	3n8GKw3DvzkvvITTznX3BpcGplICRfYOgMQTi1dIp1EYLtRj6gV1exZ+WU3vhZL9
	7oJKe50FMqFY4PNyxQbRn5fBdSD5Qa9r5Gf1hGn8q4NV8EcGN6Sq3QRA5kWnKZic
	R8i2/N7NbkyWbnpCe9+pYhOAjDbu6WeJOKCYNjSRtw7VQUrXt7AWKN16x2y5FR+R
	C9kub+lv1JOAypx7CCnBMt+tqD/vHK7dCDH3+OjuAv3XY4WVASZPYAQwMPSTAonm
	t14S33tc9lEL6WqTPl+tj75Rbd7KLqKof9Gy22M/BnayJjCN49OA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aybqv28hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBISnpq040660
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxfy0hv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7Bp37J6iFt40MFs6l4KVuCmb8viL9TxIcjA80wUyKMQ6vF4B/hW+cNBDEWZfSFTItS2+NE8ftbBVzT/YcAkzky1cUos1R1WSfY2OMQ6e4a1HpgojPERCf93bdUuRg9oJAyGvCkKigUhJqxsRPjGIsEXCNEZMYMFJXrP0JBfll0irwP1nJdTzZOBxxKaD9XMJcBVEBwwBvxvo/46vwQDqdocTvAVMkT6MKtx13x78HI4teqw2Y68uNy2+zfj3Ub0y1gIzDa/oGgLq2rYW5ZapEriJtz1CLGI1SxI/tSTC1XwiU+zZ3x51H2FJ6iidOb7mriZaAxxM0j+QBPJHAMcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fubArn1F4YGv9BXfroh4SUuSQUOemcGjgpz3eWwT/Ys=;
 b=Tb2uwxHbtBCpPlaTgL1cUDYRPolyJPye9gsIz3XN7EmRXaI0VPXZyhDBfi1RDaGvVy1/yVjly3IeTfaWfDgVRYcUm6rqM2lLY5p4JpLItZQinDDVvSo6T4f98Iaahi0u53ZosBr4CcXjPua8fcq2uEtbyad51VEuE5m1fQSH9RiTjhvwgvNbgfSBFLmn5HgNPwgW3xJbC+v6NrzxV1ej2QadMIuB58G9GFTWYjNlgZxI5WOL998eSAktEKw/BpWOPvJOCGN8AyxoRVL6qTmxQFaiinY0w+V5V2at98fMoup4kqtFMyvFfOSV4vJJkgLiF2TFUvE7QNOT0FKo1/xvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fubArn1F4YGv9BXfroh4SUuSQUOemcGjgpz3eWwT/Ys=;
 b=ECTmW9NoGxglZWvJGHntw7JBkq5hk17K2ppZwXbXV7y6ao/F/4MzoKpmV5ASh135WJzTAtLzakyH57TndJ7yu9nvbZlygFcI9X7cNe/ZYn103BHkuZ5/Y22/GlH6QfowbsSzeUH8VRb43F5T2/7NNX6yPaC5dVLWMzXWkeshtsQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5073.namprd10.prod.outlook.com (2603:10b6:208:307::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 19:00:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 19:00:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] doc: Add trunc() documentation to User Guide
Date: Thu, 11 Dec 2025 14:00:02 -0500
Message-Id: <20251211190003.10486-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251211190003.10486-1-eugene.loh@oracle.com>
References: <20251211190003.10486-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:510:174::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: e11f9758-b198-470a-801e-08de38e780be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JYTBV8XAEzO1cMcj9Utvbb2WF/0A+jW1DpkVlEu8auoFsI3uAZ1ncmpzvMyO?=
 =?us-ascii?Q?P3uWTv5f+Azdh132Kfc4S3x94mYdYm32DyQhy4FUzPebTAWkJ6jfHRWGjbEx?=
 =?us-ascii?Q?zii+IJvFGqPs9HlcbtGYvisProjia0CANyXfP2egd1AIPbCsWl+VruBcI4Kn?=
 =?us-ascii?Q?rFXuDoePUoQVU4JbzAeJ+PFJ3ot0VfjUMMOCMj7curlSNEvPGbpzh9kpL4Bw?=
 =?us-ascii?Q?/ez6idgmeGUNgXxQda3dKmUgebuDkpHY5lH7DcyBvwFaprvv6nue+FEut1hl?=
 =?us-ascii?Q?C6VWdqJ5zGibWQqLJcyonw+wn3FazbrsF6z2Vvg5yOWnyMwmxFQZ2rrt0yF0?=
 =?us-ascii?Q?3UYd9wyKgy83ddBOIfs7aj2yMdRuaUClkyccBbMLMg537GKJlsdDGPZEfVD1?=
 =?us-ascii?Q?KXsDY7uCUfdb5h47SN5gkX3xO5FHL9ZcpghzIPs/D2Jc9kNZalEKroVSdm04?=
 =?us-ascii?Q?E6ghj95lH3DMJAeqkdXcvzaKhO3XTE9Qw6jzJi8L7XeUenswGWNKYNqPaUo1?=
 =?us-ascii?Q?KQFGwjKwzBpag++q/y/v4JmI117Mn94uH5H29eQwWfCaU8tUgvZrfzYg1wGM?=
 =?us-ascii?Q?bnPgpaUZuEGtVOfyIKsVOEJ1e3kxakf+knQOAuzimCWQig6LtMlIjM2Qbp2t?=
 =?us-ascii?Q?xWexWA+fhlgH9FqQIEtJvSc6YkobNBcIp8rVdwpncuCyHdquB1nY1FooSQFF?=
 =?us-ascii?Q?6Plt2S68cYdp2IQUHEOONh3hxMxbeN6PlNvOquC/gYEBwe04TxtB+GHzsd4K?=
 =?us-ascii?Q?qL82e97Avx8eE/Vlfq7juUR3nhSrI0NjTLwYOgCdSFDkgKgh5Eo78yQu/5E8?=
 =?us-ascii?Q?tsPK1ckM2v9AraShfiGBxYKmRoAj/+roJq5QKUFEOwjKU0pG/KBlX5XrB18t?=
 =?us-ascii?Q?TJalBHgJAKoztb1jvtvt3tvifAE0vNiRUp4q+Y4K6o+asUdLeWXIMlMczUnY?=
 =?us-ascii?Q?ask24bRD6rT7XsRp4/XYQzTWRFAS0+QJGnvnZ852LM9IEqQj1LbINKBhehiA?=
 =?us-ascii?Q?l5QUIPnm6AACFIpFvF+NxDt0mHmmRnHQ3egS5vM3/B0Mhny90ww8Gvbbrjne?=
 =?us-ascii?Q?pLqdYDuDePIx/8IoF+yrS99K71PdTc/2aqSeaTxD9eN5yJSvY5huRnVFhkzr?=
 =?us-ascii?Q?bbq/h/C4hB72zLNlJ/oDkIzJLp1ADLTZg6Wrlr2ywExOrmxIAYL5CBc6+vCH?=
 =?us-ascii?Q?/YEC0tlgnlMPbRzTzP3HrqxKG+UzhGAYslzepyflF2qHdE3LyOZDc7O0nWE8?=
 =?us-ascii?Q?G7VDOd3t/c3/bdBkT3r3N0AO3CX81AN6TUVhAgQ26l1UkuiuIn3MqL7Cay1Y?=
 =?us-ascii?Q?L9TxHzeUclTotghO1wYdxmxMF5JX8oni+lObMfy2DLEoCppFW6WQAn0gFjeM?=
 =?us-ascii?Q?En6G8CH++jJv48EKA5i8mo3ANjl4sYY+eTffmBuGCMS13To7u9ot6H3f5H5L?=
 =?us-ascii?Q?lJBppUpCLK+9l6BPw3Wyi9LGF1h3+Rsv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0nDVYX6jcQqTigNJQb3zotns1+H5UvwBxUJ4e9WT0rSXvn2RQGaBZ8mJ1/DT?=
 =?us-ascii?Q?+Kk+F7DhPxkEbrDz/wxN81vdTHtp/pKxkeMXixfJ5vIE7bq2syPmB3raTAlP?=
 =?us-ascii?Q?H1z+lvc+z3FzQ9zQnNJ3Z1g8VfJBYFFaTAAuaUXhZPdF5MeFGTGLtwOWfLWt?=
 =?us-ascii?Q?YpuuYQERh1vmiFmoso3ItkbAoJ7Vtb/elSPFRNxuaRo/DeMFD0705qlNonuS?=
 =?us-ascii?Q?SHlAakyx4do73fKhAZV/aUYfg5anXl/K4DiNBMT0SzJkIKAvUJJ1nZYLCQFF?=
 =?us-ascii?Q?9mBUjIg5KpRVgWwQ/v6V8xw2HbhGA1+5V9Vz8laLcvv6CIgG2hmv+9Hq+8YL?=
 =?us-ascii?Q?SRpdCXO0Jvv4f7pz54bWEi6mbcKg27GMjSP+TlexsEPxVC8pmVjOsifMmvHo?=
 =?us-ascii?Q?zKQuBrKJklBygm6mkmR02X66IKJD+bvmkGi0cjI5jsA90zz9GpIdqBLlfSDx?=
 =?us-ascii?Q?5EmXATHXVpjEgzCqc5m8plzji1tlU74Fte6MohoGRa05cttoXQKeM/U6+Xwt?=
 =?us-ascii?Q?+ZFYyKEhgjX5DQbTCzUEhSDjyWhYmMb1qFwSRjoTwjtM0Ny/RwE79gxY5wXt?=
 =?us-ascii?Q?8LgJxRzI1d9QxNYdyMKsnWzpgCutWAdg/he4t04TfORyHTcXZjM119LfeJDK?=
 =?us-ascii?Q?XqzrR3few3sMwfkc8F1e0whR5660h1jeDUYFXwBD3eGwv2htJMXh8UMwj9LU?=
 =?us-ascii?Q?DGJ+ZMJDK7eIsTtMDXSigf/mHGRs20w6CQz7eRYFjo0ORXycSdVwmJwbkPxS?=
 =?us-ascii?Q?7H3sTkJEPVviCtx0Y7NlBJuaAVi4LdiwtnAf5PRqmQvnWiDOzabhEDzQp2jq?=
 =?us-ascii?Q?8L9EBDD+QyBq8/NzUuvVVCcAUwS0AkTDRGx+vixD2qQxEc3cQEVzkaB6OqUL?=
 =?us-ascii?Q?HxNQKaavO60oQhkRjc9/MVB0UXY3Xckl3QMavDey9byIALdu3Y4D0zExZ+FP?=
 =?us-ascii?Q?qceFUuzfVHqBuvPilqpdxjJvjfb2RSadPUrNzR9bayqjV8slT+wqBOEsAuYt?=
 =?us-ascii?Q?+lxVRKUz7/7YTDj00npkUD+nSNpvaMJvC4KthLbdDioY5evMKzjY9xmdmK6y?=
 =?us-ascii?Q?uH1a5np9ljIQOt/Ov4J/92d+KS7qcxdEdpBOC8hytVvMVF5mqI/XxkKSyviL?=
 =?us-ascii?Q?gLFY/qrGjhQ5+w0Jgi13TBBiuTXD1m1N20t7cM9K4JtKP2p/f20rWHi1GXE+?=
 =?us-ascii?Q?wcGUsxwgZCCtv7jATLlS4E5Ge9DjjtDrRIbJafKLodOP6mi/KLJjkyLVBRsj?=
 =?us-ascii?Q?F5bJefNHZDxodMxBjyvgLtgkhaaR5Zd3htxfm30n/53GMq4gyrN5i5bFQY7W?=
 =?us-ascii?Q?VCVKip0UF/kTSZV5vmQUJ8M7NlXR/QxdIGXuFi4ZIRqUeIGHmnP7ocLYuaSU?=
 =?us-ascii?Q?ln6EKdDX6h7K/asrNOEqIIMebVJhnrhQdEp6ZR2m/tivPr5+aErbnLZdt4/E?=
 =?us-ascii?Q?YD75tA/kBeSg9FNm1MmCH5Dwx0rUfknGKY2IjiIBu78YT/7TQuDCZ+Y0kAlO?=
 =?us-ascii?Q?UNW2jzDE/nvMKq/FYHS+NBhBH7W+w7RXedM98TX2NcJSaN500FGGZj/Z33tE?=
 =?us-ascii?Q?Fma6gP32hs98OOO9foFl3YPjikZ24Av3B0d100Ua?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+c2La3iNYw6mHN3TyoEnSsh/Vc4BgHeJB7Ia2CcV++5LArB8aVYk0qhhiV9kYS5l+gJOUJiMPDoIiRALHF3tYpGr9+uBW+fgXqHl5nsWUqlP2c6++/28bmU9Y24YyM5Cp/OFnxMer0utfpQJZh/7vQoTtk3gQ53GKAY+AihHrexXIZFu/oe2QpiUhqwMBHddTIBvIp2Txi+etLDOo5hun/46NmUDIFAG8LnP6/ZIBk9KelUpq2CTn1EcWvuKtaiQVyfyIRQQqs/plHeRStdD2VT+x5noZLa1orNsCUL5MmqfX7ZI7YfYz3RKX7K0Z+xxfiDyaVcGj4v/JlhPHsvHQYRCNqTTiNu3aJDEKsoqD3aUj0QQ+NHR2vWlurgd1/aRG6+WU9CQmnktFdk0+C1lIULYYzmu5EvS8Fxdydc/SRQ17GWYVuxw+xDh67gf6TLhzXTLzFsXAGWJaf+atmOC8PUprrku809o0wxY7LpRHXGeui6Ah8wJ13rSAstQVdg391ZtS1hvqGkiarPWBDWxiDqjjfYeqjsbgv87EBsabqyFKqO1ibTmJViWeuYhxOvl46fpkWRoRmU1y5L6SVHzi3bw1R7Ew226mfukmiPjOBw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11f9758-b198-470a-801e-08de38e780be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:00:08.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy3UHjQzKwAqGxkaY91j2w+uTj+ne6ci35hbkiBU62FhuM6V+QJlIV8Tj8ij1iwS2zcZaUsdC3bv8WKBQ04YUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE1MSBTYWx0ZWRfX86dImvqLDcjV
 WXxPFCZ315ElhouejPGf1WHe36iXrzTGM9UhKWRHQ+6iwkE2eNzZEHhne5n50FoQs1jB5huCc3M
 sD4A95/o3wD5m1B5OlV9OpvDL2aqSpJEMaxjDz1mG+9fpFW03ZqoyGv5NAaqqfwhcb+0BdKSYFT
 Jt+FXoFTiT3VFL18xaof7o5L1vPxUoFlgHvgdwkIkZxlRc0wa+5G0lUNYCM0Q0BHFbJvwb5yyLM
 E2QPdKkoh+9G5FwY1M46+1q00UxUK3SVd6wokixqLtjJBBEGMA1NDNN36zuw90G2qgKm0xJYlUW
 Xu+LGtZQSR82hwpBPvP9k5r6f6gcae7lzx/kSsq8LiRguV8ineCDoD7YSxFz4WwM1ysfiQUDaeN
 PF2jhE5ekhl3h/htX6TFw2380mJ9pyHXhwWkmM4DYWOZ7PU6tmw=
X-Proofpoint-ORIG-GUID: lvLCVCf0ZlUELPZqjlyukchuD9oL28zQ
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=693b14bf b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=azXRAOsOpB10XA0JrBwA:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: lvLCVCf0ZlUELPZqjlyukchuD9oL28zQ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  1 +
 doc/userguide/reference/dtrace_functions.md   |  4 ++
 doc/userguide/reference/function_clear.md     | 11 +++-
 doc/userguide/reference/function_trunc.md     | 53 +++++++++++++++++++
 .../reference/unimplemented_functions.md      |  7 ++-
 5 files changed, 70 insertions(+), 6 deletions(-)
 create mode 100644 doc/userguide/reference/function_trunc.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 7d6b1caec..3bf731c67 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -179,6 +179,7 @@
     -   [system](reference/function_system.md)
     -   [trace](reference/function_trace.md)
     -   [tracemem](reference/function_tracemem.md)
+    -   [trunc](reference/function_trunc.md)
     -   [uaddr](reference/function_uaddr.md)
     -   [ufunc](reference/function_ufunc.md)
     -   [umod](reference/function_umod.md)
diff --git a/doc/userguide/reference/dtrace_functions.md b/doc/userguide/reference/dtrace_functions.md
index 9a4f01363..7bf37794d 100644
--- a/doc/userguide/reference/dtrace_functions.md
+++ b/doc/userguide/reference/dtrace_functions.md
@@ -57,6 +57,8 @@ Functions can be grouped according to their general use case and might appear in
 
     -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
 
+    -   [`trunc`](function_trunc.md): Truncates (eliminates keys from) an aggregation
+
 -   **Speculation Functions**
 
     Speculation functions create or operate on speculative buffers. Speculation is used to trace quantities into speculation buffers that can either be committed to the primary buffer or discarded at a later point, when other important information is known.
@@ -392,6 +394,8 @@ Returns a string translation of a hardware address.
  Traces the result of an expression to the directed buffer.
 -   **[tracemem](../reference/function_tracemem.md)**  
  Copies the specified number of bytes of data from an address in memory to the current buffer.
+-   **[trunc](../reference/function_trunc.md)**  
+ Truncates keys from an aggregation.
 -   **[uaddr](../reference/function_uaddr.md)**  
  Prints the symbol for a specified address.
 -   **[ufunc](../reference/function_ufunc.md)**  
diff --git a/doc/userguide/reference/function_clear.md b/doc/userguide/reference/function_clear.md
index a36a14ff8..de620b650 100644
--- a/doc/userguide/reference/function_clear.md
+++ b/doc/userguide/reference/function_clear.md
@@ -7,7 +7,9 @@ Clears the values from an aggregation while retaining aggregation keys.
 void clear(@ *aggr*)
 ```
 
-The `clear` function takes an aggregation as its only parameter. The `clear` function clears only the aggregation's values, while the aggregation's keys are retained. If the key is referenced after the `clear` function is run, it has a zero value.
+The `clear` function takes an aggregation as its only parameter.
+The `clear` function clears only the aggregation's values, while the aggregation's keys are retained.
+If the key is referenced after the `clear` function is run, it has a zero value.
 
 ## How to use clear to show the system call rate only for the most recent ten-second period
 
@@ -35,5 +37,10 @@ tick-10sec
 }
 ```
 
-**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
+Each 10 seconds, the counts are cleared.
+Since the keys are retained, however, keys will persist in later
+time intervals, even if their corresponding functions never reoccur.
+More and more keys will be reported with counts of 0.
+Thus, you may want to use [`trunc`](function_trunc.md) instead.
 
+**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
diff --git a/doc/userguide/reference/function_trunc.md b/doc/userguide/reference/function_trunc.md
new file mode 100644
index 000000000..b15cf3fe5
--- /dev/null
+++ b/doc/userguide/reference/function_trunc.md
@@ -0,0 +1,53 @@
+
+# trunc
+
+Truncates an aggregation, meaning discarding aggregation keys.
+
+```nocopybutton
+void trunc(@ *aggr*, [int64_t *number*])
+```
+
+The `trunc` function takes an aggregation as its first parameter.
+While the `clear` function clears only the aggregation's values, retaining the aggregation's keys,
+the `trunc` function removes the aggregation's keys.
+
+The optional second argument indicates how many keys to keep.
+By default, no keys are kept.
+
+## How to use trunc to show the system call rate only for the most recent ten-second period
+
+The `trunc` function is used inside the `tick-10sec` probe to clear the keys inside the `@func` aggregation.
+
+```
+#pragma D option quiet
+
+syscall:::entry
+{
+  @func[execname] = count();
+}
+
+tick-10sec
+{
+  printa(@func);
+  trunc(@func);
+}
+```
+
+Contrast this behavior with [`clear`](function_clear.md), which
+retains keys and simply clears their values.
+
+If the reported aggregations have too many keys, you can use the optional,
+second argument to indicate how many keys to retain.
+For example, you could limit the reporting to the 5 most common
+functions by changing the `tick` probe to:
+
+```
+tick-10sec
+{
+  trunc(@func, 5);
+  printa(@func);
+  trunc(@func);
+}
+```
+
+**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
index 942e16cf0..f69600b56 100644
--- a/doc/userguide/reference/unimplemented_functions.md
+++ b/doc/userguide/reference/unimplemented_functions.md
@@ -1,7 +1,9 @@
 
 # Unimplemented Functions
 
-DTrace implementations have varied in functionality, and some functions aren't relevant to Linux and might never be implemented. The following functions aren't currently implemented:
+DTrace implementations have varied in functionality,
+and some functions are not relevant to Linux and might never be implemented.
+The following functions are not currently implemented:
 
 -   `breakpoint`
 
@@ -24,8 +26,5 @@ DTrace implementations have varied in functionality, and some functions aren't r
 
 -   `stop`
 
--   `trunc`
-
 
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
-
-- 
2.47.3

