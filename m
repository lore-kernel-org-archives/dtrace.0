Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32141459FA
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440252; cv=fail; b=lDqXmlvTgw5HijXV4lkpAhHycHeRCQv8TUf9wVxNxNgevCtNJVK+t0COy0zCWEYk2LnSyf7AqZgboTNalfqn4wOBBvo7r1g7A5BLJA0/sBToooym5afrGsrJ5hg1recB2yjU2ZBELzdQYYYGWuMAap+HS4knfMfiJZ1X2fNu214=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440252; c=relaxed/simple;
	bh=/sgC9OCiL3Cz0rK7SpZecDTjtHr315lT+d3vrWFn59U=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tKXDOHmu+DAQCCpUJHxYagOdBT6T1JTqbX5MMxsg9q0GN9LbJPt42yY++Bpsk1NGr++3GZFrPTRiqG7DRlQ/siVFIvYCLrn2x80Xq1keL2RlSA+OY97GAVs8PXEUhP/IeXlDKMPHB4xQwu/P28fKerdsfPP5djYKNFfjYJsdzlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CjfT50Lf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pJfExnkB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CjfT50Lf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pJfExnkB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI2gJ0i000643
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 04:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=IJ9XzpOu0sbzHPMm/NsJV/tyZSp3PnRKlMcfSxV5P9c=; b=
	CjfT50Lf9kH+MROeaIdJzMTXY89crKVJD3py+oVjkLTogCngI7Z2eq6Mr5nqP7+6
	FQaKtQDnzOHsIbyOLsnZuQQLScBbsPdV0INCHOCel7Hts21so51TjybxoJgx2DUz
	tLvGzFnKvmDfENBzgtmo+SJ/cpFyitQ9XACwmDqLkHupU9mrjux24zFkemkuonnF
	lbX96b3aE8SWaZfYhrqZ7MqYHQ7GpYnBECk5ARiqtxVAuy9hegii1PtXCFbtKD1Y
	12bZzU41Y2ScrzRIPlcu9hY+KOdopRenOg/bwDqy8Utkq/JJVUI5RXznES6/6hM3
	+Qf3gqDr9WU+Dez3sSgpZQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejd1c0yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 04:30:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI31J86004281
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 04:30:43 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy8bdbp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 04:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NthFTZoSSpSfFn7VmfRMJ2sNwVKI0jvL23dGjoUPjPaX+UwtQeZDosmC/iBag3tD5oERj0eEy1uaP3trcSRqLzKpSmksg766z5OXXiDewnKQ286UcNprLSTfMERTaVkG87GpSY3aXjjI+5/w4pY0rhjUVTMZaK/qp0z+jBEgfYjk55amyt+hMP8ky662s122eZyXLEPRDsDAEXUFqFcAHssJfAtjU4k4ASzyW4IOgrDvi6qxoHHCt0tvuV9uHpylLjUWax5IbPoCi0mXR9Tu+QC/bpCW6IIbOUHG7r/WcG7NVPrSm7u5iKB/G3SrPpckIqi+tgPQGUBlfV79qmxQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ9XzpOu0sbzHPMm/NsJV/tyZSp3PnRKlMcfSxV5P9c=;
 b=GRUf7Y7NaICoHiZYcUPPpIpClWC8NGka/5Jq5G0VjhvJ0ZYGpeNfYbDAukcQ1D8CorR0y9HCLgdfok5g/+MwaMj3G9B65fTFxv+5ru4bQX0esPj0HmYwF8vfYrptezlZHqTC/HOi7tnAc5+i4igLuR+su7vohiVxLyQ7pki3h9filuhOZI+83lG7M6QeJTZRebSg1evZQK8Xc896olnbW5YVQVYbrBmg3dkkWyAakz6/k933bmy5ClO/6Z7F8YTPW1VTnTdepwQLULlGbfi6i/OcNX/5CmKShNfJgF7qgdIlDdoaVooUHZFtfBqhQAyryyAhE+4H3V9wlLGg+iF92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ9XzpOu0sbzHPMm/NsJV/tyZSp3PnRKlMcfSxV5P9c=;
 b=pJfExnkBGWDUY3RdVwn3vJlqqTdc+jX/tcmhrogOWBSSTW5Z+iGTmk2GuX/iMGk8Cc2KZzNscEWja47oP1EQ5L8QhCwr+cbASfAPv+26X3NiVSGOkWJ/mxe3EK311PgKBplr8nKkN+XHQaUu7FC3sFfCS1sXxo3iFgVR+nxJuWQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5082.namprd10.prod.outlook.com (2603:10b6:610:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 18 Nov
 2025 04:30:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 04:30:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: Add stapsdt provider documentation
Date: Mon, 17 Nov 2025 23:30:36 -0500
Message-Id: <20251118043036.16867-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:52c::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a67325-90bf-4b31-d750-08de265b3a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BqD386eQc+oAo0Uj8nBTbwQF58eRswlklY7IykIfUGeLCZojxkVN9wFk+kav?=
 =?us-ascii?Q?7Mwuse1Qg2ghNJoe7QioY58CVrI2EAu1zE62mEzk6xrMz4sR8frhI5wKgOUy?=
 =?us-ascii?Q?UMYUf/WVsh3AIekhzUm4JpRFRuzF9Mu18312GNgvRv0XxMbsKiE7WGC69/pS?=
 =?us-ascii?Q?vUDPIo4m4AogNEWoN+z95eai3qZPvJuwmocVYyydJjOAx45s2jHpDQ6rawkq?=
 =?us-ascii?Q?of5ke43sDas+9O8GTeF1O/ZRS795Ie+2dFkD5K0XX6oNAGJWBex53l6cEsFV?=
 =?us-ascii?Q?Cf7OG6jhwBLQcsFNdhRY8sRCdTfQ+uam3AKnE1DRlpLECknIJ3PP4lsJBjxZ?=
 =?us-ascii?Q?/LyHVpgcosicCrgMInJdZmdpyPyEaISNmHTMaVryJcBlolH3f0OAiAGi+e+T?=
 =?us-ascii?Q?whactbUTzRIgnVdqQJ6UVpZy1tRUf+1L35Tl6b4JIPSgsJZc/vtfQWK3t/k1?=
 =?us-ascii?Q?jlfnPXq9sSsuhSpJmB4SxigO0L64q99NeK+eaXyJQd+U1jnwKRNvdhuaaR8e?=
 =?us-ascii?Q?Zabap129TufmTjGC/hv3t/TeW1aqGDRzz6CfyAT2SImDlKiOcf47hyJtcEZf?=
 =?us-ascii?Q?mA+mhrV7L0Gor5tzSe9QpBtP9XKtsL+R50rm/JBIUiSuSs7Aiy0Z5OapSwCV?=
 =?us-ascii?Q?eitWDU4BIvHdBbAIcRClqreW0qNd0FZ+iZUMN/dBSueT7h/LMNzbuSD9zEt3?=
 =?us-ascii?Q?cS0DAXAB0espGyQgJ0RfsI/NGWu792f9XZxudaxD0RF5qay6qA6Ez7XLQkhD?=
 =?us-ascii?Q?1/qD9eUXxsuIl91HxUVGSyUGozVOaOYINifG6Kn0HpTzLZGhnonbyqCRu4aY?=
 =?us-ascii?Q?wTViCceT41tAGXmG2Q03bG/ScfJdd+yUtCd3iAI+P7yo/C1TfghntgCSbmFk?=
 =?us-ascii?Q?xJ9TtFB4n/uuFipRS2oAHptPwfwDht7+25q1ubY7OD2d2+oqOlBH4aRMbhnY?=
 =?us-ascii?Q?P8x+nYYClu0s4pPwOKkj0g4JodXHZHAFIsT89EfPLvJrhA6aWHSwjbthSWkS?=
 =?us-ascii?Q?XQoCz5AZ505CmkjwzAAHX4+8QO/c6piMP1rN+GOldRUVE6d82Q+rDm27M9zA?=
 =?us-ascii?Q?Zl1XUf9Gb8pvIoTd+auZqYD4I5G+8iTwaCvRof7KTbFavID4nWI8Me7LKLcx?=
 =?us-ascii?Q?KiXLaH/kSCix/UieFLm5R6hShdxtOcRqOkJe6bfQhkmtvrWJW5TlHstPhP3N?=
 =?us-ascii?Q?pa/sjVmogwFe6KPpT0SkZAYNlV2dcaUVNIwTi5UeBV1+g3i24i+OTXUgQbsG?=
 =?us-ascii?Q?8jXQP5Z2U1XUluiU3Gto9Jdkm/wanUw2HlTGSUW9Id3iER6yRcqYI1wafgNj?=
 =?us-ascii?Q?fCpLMcMUPo5ogBtLPt0sCSCFvYnRifHqQhDb0mwalT4tQt8AYqXQlAVLsLyT?=
 =?us-ascii?Q?048pHR+QFJuDLq06AmwzGa0ksM4t4vxvYbKTr+IDksG4E+/9hHvpL+RdTa13?=
 =?us-ascii?Q?Pqmprhq6EfHHsPtubfsmcoF7zP/501fcdt15tiotyj+Nl3yaZu7LVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h/vRuK0zPc0MvWPO3Qw/GuSQN82xmKX9TjTA+jMka+MuFFT4MSSoBGypiUZP?=
 =?us-ascii?Q?t6BXGMgkRM5nyrihOlyfvO2ygE8JJwU4/AH+SQUdAeMP4n8JxGqLd7ckPVPs?=
 =?us-ascii?Q?q3qCgrYxIeLERhhsZpYcd7ov/QqQeAjL+Hru0DV87End/aNQHgI7Qcr/X4D7?=
 =?us-ascii?Q?ZNmH1K7OiT5R9a7RTVvQOMIJ1mq8fhlOSceFqi3WX0mzZAn1/jSGgUYd1bUq?=
 =?us-ascii?Q?8wRi9Bw6n+sjuRbWuEWerOTFMmdCP4NNRt53PbjR5upfgRHaP9Mv7YJR2gUO?=
 =?us-ascii?Q?+9WfzfdAz3UqEeAp5CsyOTj7GL5bBhYFLDWkUM2j/R8XYBofb6eCkMMYkP/E?=
 =?us-ascii?Q?eTNffAiEsTvaJ0Hrkh/KuFjFfgLwk+jaTxbjFV0SBZmkYmn/krQXEUCOzEAx?=
 =?us-ascii?Q?7uGc+1P6NfGd4zi9xEoTCjJlSeuFJW+8TZNqnj2Wn0G8f0Qatl8uBpHlMe6Y?=
 =?us-ascii?Q?dqFtrhI+cSbi4pUqq13NQmov3YTLD2fCsvjy/PgVwnyZZqNoZp7eeJjAJsw6?=
 =?us-ascii?Q?tDi4BYIagJetK8Ma7qpE50fnwOlv3PogIVnRjhNWRBLWJYnr14GyCLDe1WeR?=
 =?us-ascii?Q?Hn7po9/3npF/xUh8Nxhbaqx2m2wUL+W0xy/4kV3h+0LjWmFH2R30OHaS1acr?=
 =?us-ascii?Q?pq2VRpMI48FUeAnlXLVEeSO9Kjb7GX61pOsrxO1WWA0TqM7fxEurECrpDSnI?=
 =?us-ascii?Q?6AhqvpL9JSAWU+qnWNnLoeujoVR5npvV30XNY2OA9bv9gCGOZqJBL4Iw5f50?=
 =?us-ascii?Q?DNrwsz00EQ0M/0sYAIbmTKdQZqg2jt2yRZhm2w8FM39NC29YAwnGXRQ4vpX0?=
 =?us-ascii?Q?W5IfHZ/FvJW4ft1NFO9I3SdGGfu8FYJ/cNRuHk2n8z2z/njdchP066EAhrXn?=
 =?us-ascii?Q?Vajxq6Csr+hdD7WFg64NLJvmECVG/uVtIH2eCvGfZcxqZYHX5cyTcnuJ57C8?=
 =?us-ascii?Q?WqGDWVTrfp8rBS6cdFwD3lbNOoG9BDoZN2avQPioFG8VCu+3Jtv2eIyxxFWz?=
 =?us-ascii?Q?x35yJKlmwmpeBbAycyCj1FURel9BPPc1SMSErpLYJhJxHOVS5rU0f5Jl0HGD?=
 =?us-ascii?Q?D6uhkSigntPsOzGimvDrvY7fX65hrDpKDV/0pRG7kyqlFyQp/boYeYgHh9nY?=
 =?us-ascii?Q?qu+Ic3QimbwPbaNujDHZ/m85vZtGSQrXRosIuusTW6Ezb4gdlSq3YMBqbmWu?=
 =?us-ascii?Q?j6UENFmJG0bXEi+aRugr/SwSfGLoLVs+26bZMsy5AaPTqtrzqzXG4zsSiFsS?=
 =?us-ascii?Q?NTXg3ivJxHKxE1je+9ziWQC75oGLWJ+bCGsjv93+Ar+Wo0le6GWqF8JBCd7H?=
 =?us-ascii?Q?W8oiwY2ZcMxv28vvk1P16WiS5Bx3fRBtT72xJjDWQtArXh/VOedx1CaUwB3S?=
 =?us-ascii?Q?Mo5u9EoIHYGN3heUVKiw7OlHBfsVVBefda75koEo/7A1wiFRmA3JCH6iCcxE?=
 =?us-ascii?Q?bem/fkyJZtU2XYHhcEP6gbAMhle6WpQaifXFqdSv6kIMkVm+jDejyhl0db+x?=
 =?us-ascii?Q?oe5LNOe2QJsY6zLtvlfC3Sx6ukM48YyuzPH9kSelKKJlqrZv0RhryrCOnMTN?=
 =?us-ascii?Q?YQg12HbPOtIpzlA0X0SVONtbXsNpK2sb6hGE6gMK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1uh5baa7hesrMv5CVPBT59oKpV6tlfZFgV72eCNNIM34q3Af+gvtdSpSGrBF/n6ANgldGmc8YKBrbBMmvSh47ryA9ed0+QXjE8hYgJ94iL3KTDFJukbqa1dsrgAoghmIk1f/CebvZuhhhWEV/1kKQK+cp7C8/8k2DCP0iqPorkXBTh+qBL1EQJvMt4kFQo/2txS3G3leXRa6LiqewNiQvWYqWN/F4b2wridxTPWS6Re0mzOsL9WTuQKKZ3vqgPbsbgN0dvjcubyqpOHJyAuX5FrP2iV5pY6k80s+5Baui9uMPdi8oSaE+5GFHKV8nR7sBo1CWdqiUAgyVgZQEr5TVlut919iQML2Xu9/GYaYDN5Bd9qhjDLtMdIxYUYIBm0lNTtq7DJLkjvHAmaMQqknqfaE4tjDaElmQdxFZr/nPodQUbGqcwt10xTfGmjf5mVptSQNI7BAoie7pSToRXuJdQnSNNHAfAc+Dhe5a53IIErnCujT6WObXEpHGlBsW590DNKCQNuRTrDWG+DgBWPe+TVqHq0QH6vUNTVGfeX8++2Zn0oupj547vsTXRlG5Al0FX7wGwI8rpcZUV5Yh1HI4wkYuu/v85BlmPp3nIl1ZwA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a67325-90bf-4b31-d750-08de265b3a55
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 04:30:39.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WD5j1eVAE4o0mOuWTPCZOjDqi3V8oymkXD8d+7nGlIwUEU5hwCZaZmuKtiHCcDZXxm9tnIfz3RhIeQlF5vOwhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5082
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511180032
X-Proofpoint-GUID: E-8RK-XRmh3TNbKDqoAg4eNQpoI-92PO
X-Authority-Analysis: v=2.4 cv=Z/jh3XRA c=1 sm=1 tr=0 ts=691bf673 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8AHkEIZyAAAA:8 a=NEAV23lmAAAA:8
 a=yPCof4ZbAAAA:8 a=9kH7JQHonROFIm3Q-xYA:9 a=6BMzFxCdaGUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX43ozpsXxKLLH
 vbvaCllHn26+ud16uP14KROli2etmILTU87U3EFPFg/GpEqGua9mK/YgGGdgf64aOpn/FzR6CjA
 sseQ5yDYCWZd1MBU68OL3rozDxZ/Sn53RJP+GoJn57hyV7OcAoT84oBJfxwg12eI78oq0sE49U4
 2TVXJszuhkMZwl6DwWhigSgMmIIbffVBbt11ldMzzQUXEeTLgNZmobPXEknzI0KE/Spp/xrhlmp
 FDLOLEmrETJmA4rZKr7yi8dVg1koj70a15eYcYGOTvt9FL8aLgBzk9MrVu6xMX37BhnBvavnY5x
 W2fom8iuydl3jmSiCXMEFEp1IKIMIiY26KAZa1Od1ireRVTwTtb8pSSQEbXM7uhQrZ1CCADCdl4
 g1PHWygICTleVIBsUQKRRCGFyYCCqg==
X-Proofpoint-ORIG-GUID: E-8RK-XRmh3TNbKDqoAg4eNQpoI-92PO

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |   4 +
 doc/userguide/reference/dtrace_providers.md   |   4 +-
 .../reference/dtrace_providers_stapsdt.md     | 154 ++++++++++++++++++
 3 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 doc/userguide/reference/dtrace_providers_stapsdt.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index da9a08687..3e057d4de 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -259,6 +259,10 @@
             -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
             -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
         -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
+    -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
+        -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
+        -   [stapsdt Examples](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtexamples_prov)
+        -   [stapsdt Stability](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtstab_prov)
     -   [Syscall Provider](reference/dtrace_providers_syscall.md#dt_ref_syscall_prov)
         -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
         -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 45623d92f..2f6aa877a 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -29,10 +29,12 @@ The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by
 The `sched` provider makes available probes related to CPU scheduling.
 -   **[SDT Provider](../reference/dtrace_providers_sdt.md)**  
 The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+-   **[Stapsdt Provider](../reference/dtrace_providers_stapsdt.md)**  
+The `stapsdt` provider makes available probes for static instrumentation points in ELF notes of binaries.
 -   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
 -   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
-The `tcp` provider makes available probe at different phases of TCP processing.
+The `tcp` provider makes available probes at different phases of TCP processing.
 -   **[UDP Provider](../reference/dtrace_providers_udp.md)**  
 The `udp` provider makes available a probe at UDP send and receive operations in the system.
 -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
new file mode 100644
index 000000000..43e442358
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
@@ -0,0 +1,154 @@
+
+# Stapsdt Provider
+
+The `stapsdt` provider allows DTrace to read ELF notes for binaries, using
+`/proc/` maps associated with processes, and parse them to retrieve `uprobe`
+addresses and argument-related information to create the associated `uprobe`.
+That is, the provider allows DTrace to probe programs and libraries that
+contain static probes that were added via `stapsdt` ELF notes.
+    
+Note that `stapsdt` probes do not dynamically register themselves with DTrace,
+making them less powerful than DTrace-based USDT probes.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## stapsdt Probes <a id="dt_ref_stapsdtprobes_prov">
+
+You may not be interested in inserting probes into source code yourself,
+but simply taking advantage of static probes inserted into the ELF notes
+of binaries and libraries by other developers.  For example, probes for DTrace
+and SystemTap were added to Python as far back as Python 3.6 provided
+Python is built with [`--with-dtrace`](https://docs.python.org/3/howto/instrumentation.html).
+
+Alternatively, you can insert your own probe into application or library
+source code as follows:
+
+```
+#define _SDT_HAS_SEMAPHORES 1
+#include <sys/sdt.h>
+
+unsigned short myprovider_myprobe_semaphore = 0;
+
+        if (myprovider_myprobe_semaphore) {
+            STAP_PROBEn(myprovider, myprobe, ...);
+        }
+```
+
+The *semaphore* portions are only needed if you want to test at run time
+whether the probe is enabled;  this can reduce run-time overheads for cases
+where a probe is not enabled.  The `...` indicate the probe arguments;  note that
+`STAP_PROBEn` should be replaced by `STAP_PROBE`, `STAP_PROBE1`, `STAP_PROBE2`,
+`STAP_PROBE3`, etc., depending on how many probe arguments there are.
+
+The `stapsdt` provider also supports probes created dynamically via `libstapsdt`.
+See [https://github.com/linux-usdt/libstapsdt](https://github.com/linux-usdt/libstapsdt).
+
+In your D scripts, the provider name must have the pid for your process
+appended.  For the provider shown above, you might have `myprovider12345`
+for pid 12345.  No wildcard may be used, but a symbolic value like `$target` may.
+
+In your D scripts, the `stapsdt` module name may be `a.out` just as one can
+with the [`pid` provider](dtrace_providers_pid.md#dt_ref_pidprobes_prov).
+
+## stapsdt Examples <a id="dt_ref_stapsdtexamples_prov">
+
+For example, consider this sample source code, which could represent the instrumentation one
+might place in application or library source code:
+
+```
+#include <stdio.h>
+#define _SDT_HAS_SEMAPHORES 1
+#include <sys/sdt.h>
+
+unsigned short myprovider_myprobe_semaphore = 0;
+
+int
+main(int argc, char **argv)
+{
+    STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
+    if (myprovider_myprobe_semaphore)
+        printf("the probe is enabled\n");
+    else
+        printf("the probe is not enabled\n");
+
+    return 0;
+}
+```
+
+Assuming it is called `test.c`, compile with `gcc test.c`.
+
+We can then run `dtrace -l` to list the available probes,
+assuming we specify the pid-specific provider (in this case using
+the `$target` symbolic name):
+
+```
+$ sudo /usr/sbin/dtrace -c ./a.out -lvP 'myprovider$target'
+   ID   PROVIDER            MODULE          FUNCTION NAME
+ 5067 myprovider2623420     a.out               main myprobe
+    [...]
+        Argument Types
+                args[0]: int32_t
+                args[1]: uint64_t
+                args[2]: int32_t
+```
+
+Since we list the arguments with `-v`, we get information on the argument
+types:  the first and last arguments are 4-byte integers, while the middle argument
+is 8 bytes (a `char *`).
+
+We can run the program without `dtrace` to confirm that the probe is
+not enabled by default:
+
+```
+$ ./a.out
+the probe is not enabled
+```
+
+Next, we run with `dtrace` and see that the probe *is* enabled and
+that the probe arguments are `argc, argv[0], 18`, as indicated in
+the `test.c` source code:
+
+```
+$ sudo /usr/sbin/dtrace -c ./a.out -qn '
+myprovider$target:::myprobe
+{
+    printf("%li, %s, %li\n", arg0, copyinstr(arg1), arg2);
+}'
+the probe is enabled
+1, ./a.out, 18
+```
+
+Adventurous readers can use `readelf` to explore the ELF notes
+more directly:
+
+```
+$ readelf --notes a.out
+[...]
+Displaying notes found in: .note.stapsdt
+  Owner         Data size       Description
+  stapsdt       0x00000045      NT_STAPSDT (SystemTap probe descriptors)
+    Provider: myprovider
+    Name: myprobe
+    Location: 0x000000000040113c, Base: 0x000000000040203e, Semaphore: 0x0000000000404026
+    Arguments: -4@-4(%rbp) 8@%rax -4@$18
+```
+
+Notice that the instrumented source code includes the header file
+`<sys/sdt.h>`.  On Oracle Linux, this file is installed
+by the RPM package `systemtap-sdt-devel`, but the package also
+installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
+in front of `/usr/bin` in your path, or explicitly specify
+`/usr/sbin/dtrace` whenever you want to use `dtrace`.
+
+## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
+
+The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
+These values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Private        | Private        | Unknown          |
-- 
2.47.3

