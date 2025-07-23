Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BE1853
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753233507; cv=fail; b=fdH/ZugFt1BKEwvFQluPoQxwB+oTNro7ftc8S6LUquw7LjQzxZZKhYbn8teKSvDZ6SaJWXZ+8BDgnhpOcRe5+6oUybK/XC2PH6ZqVYGFaZxeOY7lBTMBtEPV3K70U1NP0ZKAGpMfP3N6IWNcjRhXSmcqSJGvtw8rpkP2UgqkFj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753233507; c=relaxed/simple;
	bh=4G1bMG08zoEmhyk2CZ6u7w18y4N7jXYXIfDLGCqps/0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qABT4dHXvI9S2wJzmJQq8eLZk5CSBDwsjVp5W+3dthqjmUHW68Z1ql40Zw1WCZ4Yi1tqxLsdnULxFzK4k8QZ+PLMYDrfWzPEDmLK5k1tyc9wxfHn4pOC9yQ6y10NWD7CPmLyGUH5ppQFknr936Dq5pg8TKbR0Pt0kfrYkECwsiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N842vJ3u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pPLiJzNQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N842vJ3u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pPLiJzNQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMQks3027202
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 01:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gMQs/XbwNZwF3lNKqbF3IRlB+kPpulzsXfISki8AWB0=; b=
	N842vJ3uwri0nHfADfgI2TFdzDTjQF5VrqcF7QR9kIvX8PEro2XGyZjBmOJHcbab
	0ZWwP/43YiZT35cQz9iW/PX7DWivmeiqv3qY3hOgDshx2O3LeVI/7P0JhdkqlAd7
	R31Zwey9WlEQ+/cIkCk2quNIqu3q2D8o5QMAqabXBPwfp/0FyHhFmnvHTtSqftRV
	UgbgwLZ6aYzLOnbzaPBw5lhv4K8RTsNF3cKeSjVQIL1GdrQ8xKTFyUUt6n1F7Fq5
	U3uL63aIIkDp5m79Y38aeDBeaFx/71cUFr2mfeDlYZhDNB4bWvg34Cm3AwOaQ4Vz
	lVn9tyV0cGrEZEUAfnDMgA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpejwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 01:18:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMKNsu014405
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 01:18:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tgaafm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 01:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juweDOQFPGPQ9mW6OGKOpTd0K+Q3Maxs2zmM4+oTo+l9nWq/IM1AZys9UDXK3w7ZbKz8n1yaTxOeK+uKlRqRgENdlf0d3ZlNceQK9EiDUUfeYwolLlom1VIGqy+Jva+MDDq0Imz34cRdG5plV8p0G4bwIkLHJN8N9sDAq5LVtOyH7WX3DPDBK4Qy94WyTAJIPKuCcKegReVPVtIVfGYXOCyCHT5Yt+ItvgQD8zxQClqQPkzVumXu9r69+Dq3jWK5W/THc75aHsBlScBpQI+qLUFN7kdP3Ry4HVY7c0v7Q0qeajq+6YjM1h4qDD/pA0uTERNByyCxThirfOItGskKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMQs/XbwNZwF3lNKqbF3IRlB+kPpulzsXfISki8AWB0=;
 b=k41d8/Sr1UkKOMl+Zre4tzJIVUlBADtlMh7sIBMqREeeNkzBJ2qe1uq10MkvfgNHWmggoZWLhXvIDpFaIDQIszRnveV03nDnK2NrGoZn+3xMlSJBDRtPqAGPDGDfk49xXJYI4ZHkEuHFDS+pBwy8ZSgcd/uCFRbWjHGN5KmN33fXwoaNT+DiH9dtPslPevpLMI18h6u3vpEBhZwy7FWFzcPpzLwbQNBx4yqbs7RVd80DDcYiK+JQ6hkWs7RYFFOJcze24iHY9tZpS0bfOtCBD7Tys6xmuGaPuOtU2SCNAAnQ+RpJEDW69F5ctypjh8TOlO7CmP7nyexT1t0cVbewQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMQs/XbwNZwF3lNKqbF3IRlB+kPpulzsXfISki8AWB0=;
 b=pPLiJzNQpFqnJPWt8+jduYFPxtuVBnVXFc6TJYvnwKP5V748ti/eWNZj2JPYgqhawuUIYN4LA5S9ZHX98TvLnHVlpimWBL3Heyb3xaI1evz7+Uc6lbqhKxcumDAfMMRQqgPl2NztgvTWG1BPIrsdmqwtgN3PKGZ/i0dpRSYuqdM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7308.namprd10.prod.outlook.com (2603:10b6:610:131::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 01:18:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 01:18:17 +0000
Message-ID: <d1113b7b-0ace-d350-40d8-58ecf4ec2ab8@oracle.com>
Date: Tue, 22 Jul 2025 21:18:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] lexer: support // comments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56728D6097EC38EDA2B06306C25CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56728D6097EC38EDA2B06306C25CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 112799db-52c4-4cf8-1699-08ddc986ce2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2dEOWZtQkNGS0dYbHdnbU1zdmMvSzB6UHRhWS9pZXBaakUvRit2bjV4YlBR?=
 =?utf-8?B?bzVoT0ZmZm5WSEtPQllKS1hKYjNyU0paQ0ZNWDlBbnovdGxNNnliY3pGQlVu?=
 =?utf-8?B?NXZKTitDcFo1Q0FuTmdtMFN1Mmt3ckR4MmVXR2IrSElaSDlGWDVYMUFOVTJK?=
 =?utf-8?B?cWpVcm9YVk5xeHpIN3BmY01JK0EyS1lzV2IxL2VvajZLcm03YVNJR1FFVzkz?=
 =?utf-8?B?a1EwUzdXZWx1bWl3YjlaMGpFd0QvM0tVS2hEQittRk56QUFCVGs5MTNtcU9q?=
 =?utf-8?B?Uk8xb2FSOHc2S2dqamRIcFJoaEo1K285TXFocE8wWW1IYkpXamN6bkh5eE5n?=
 =?utf-8?B?aTc0eVFlWG1xSWd2UEk1RFBhQlBiQWw0bmJaWW55QVBHZFJ4RnRjQ3RIZ01H?=
 =?utf-8?B?eUhFUzFyZmV0eFFOT3Z0STBoYmRGQ1RyeDV5eE9RSDRNZk95QjEwRmJRQmJM?=
 =?utf-8?B?ZmpZcE1MdnIvWm4rQVUrMTVoSzRyelhjbElOWEZhQlVVTnpSNHhaYmZ5MzJQ?=
 =?utf-8?B?V2RvU1VQWXpjSVp0QVBRVDh0TU1qaXhvN3ZzRGZiWXg1Z3NJdUJkbmVaT01Z?=
 =?utf-8?B?TjFiajFES1BXNzRNVVdtdDFRdERIaW0zUjBKdHd0UWE2cTdOTE9wWEJHUVEw?=
 =?utf-8?B?elRiYTB1VnM4RmJmL2VoSExCYmx5anIvMlBrdTBJS2pnRGhHU0tiR1dhWk5J?=
 =?utf-8?B?dHV3emQ5bTE2STZQN2t2V1NFRjZNU3NOQ3YwTE5EZkVVM0VkaGt0bERYa2tI?=
 =?utf-8?B?MUVMTFlVUXpIQlB6dklrVEZzNFArZnVxQzB4ZnZTd0dYT1BlQ21SRHZHb0V2?=
 =?utf-8?B?WjZIS25kb1gzM2NISTkzTDV4eHVZMnZlWGRXWk9qc0JYVXYzNkcvVzhHOTJF?=
 =?utf-8?B?R2ZwbTlRQUVvenZIR08wZThiajJQL204OU9pNGJmaGp0SVorMHdTR3k3SjNy?=
 =?utf-8?B?bEllWlcwcE52cDV4Q3o2TU9kQ2RyNm4xZ0dwNkZJWS9yUkhOMlF3YTZEZUhP?=
 =?utf-8?B?WXF3VFFDZmI2Ujd2Y0ltOHl4SFQ5ZVYyMkFFTUVwY0VQb0hDb3V3ZlJjK1gr?=
 =?utf-8?B?dWxhcTMzMFdRaEFqVDMySVYyK04yS01Zamk4STRWUEpiS0paR1F4b3IvU1dq?=
 =?utf-8?B?Y0lxYm12NW5pSGJhcGxXVzQ1YzZtOXlaekxram5JL0I3U0Q2S1FxSTB1alBD?=
 =?utf-8?B?SVBoN1B2SUVwYUNnL1ExNjA0K1VKZWFEYmNDc25zRkNZVW0wL2RwQzNPNVVO?=
 =?utf-8?B?US8vN3VOVWJGK3hRTDA3RGd2NDRLdWg5Z0czRVNoYjZNR2VqZWgrTWUrVC9Q?=
 =?utf-8?B?cDZDcHJ3VWN0VitLVTlZOWtlN3lRTkw2aE1MdGJ2d09jTVVJNjZac3hEcVRM?=
 =?utf-8?B?WG52RXhwY1Rwbmx1ZlRVZVVpR3pPc0ZxS25XcENvbzViait2U1MzVWlpSEZS?=
 =?utf-8?B?WHNzRkViSUprWHJ3Z0NVQ0NManhhWC9BQml0N0ZoWHlrRjAzaXdUQkE1SmhG?=
 =?utf-8?B?VGlLWmZqNjhxMFR4VVVkZkhBN2RiWjFXNTBPb1l4R2dYd0NjOVd2R1pmaUM0?=
 =?utf-8?B?TFkveTNhbGVGNnRwbG1paTg3VVErM3hubUVrZ0h6NEgraGNBMnVFaWlxQnhU?=
 =?utf-8?B?cGcwTE5sNllCZmxhYWdpZGVMbEc4QktlMUZuK2JiaTFSZ2ttOU1uUTNQWVVt?=
 =?utf-8?B?eGdDczBCeExBM0xkMTNKTU43NlVsU2Q4alZ6L1ZNbERtbjFqdmNqaVM3MWxI?=
 =?utf-8?B?MFBzV2ZsWUVrNHZ3MjJMVlVWbEk3cXdBMUZXRGxTZmVteXUxWTdsRDMrR2FQ?=
 =?utf-8?B?RFZxMWhCaGpyQ25IZ3Qvd0d5em04OGJPNFI4NStZWG1tVWJZRnZqRGxNWFdY?=
 =?utf-8?B?d3VTZi9tTmlWaE9hTTNNcW1BdDl6SHZBdWNqam1KcnlCT2Zvek40aHBudDN0?=
 =?utf-8?Q?tBFGNY52TuE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QllZb2tjTjN0Ny9kaHFkMzBsNjd0MnEzaXFleE5Oa3NTOFJQNzUrWm9tMEln?=
 =?utf-8?B?TS9haG5iNzFJdnptNGZQSGhpSlZrOFlybFRoMjE2UmNXOGRibDMybTkyVlFH?=
 =?utf-8?B?VkRIVzZrUXV3TTJJdkFvOStXQ09tQ1dZR01EZDFSYkx3THczRVF5RC92dEwz?=
 =?utf-8?B?UTJXdmlTMnp2Y2tyTFBTdUcwODJIelcwL1crUnV5dkFKZ2crTkNBODVRajRY?=
 =?utf-8?B?dURNdmM5WVZPNGgwa1BnelMwZUFTY001MjZsNm5WcS9TbU9pWC91YkdRMExX?=
 =?utf-8?B?YmYweVpXSWJjQmIwUG9FbWVhQVVEWHVlKzh4KzdSWVpUUlJMTHByKzZUNUJO?=
 =?utf-8?B?MExJVmdzckNGc2k5eUlyV21nQU9INlF1ZkxjM1o4M0E2RzVvZm9pVEdOYVFT?=
 =?utf-8?B?MHZnMWhEN2E2dUw4Q21SMExBdU5lYU1oRlBVVFlpYnNYS0c2YTlQajNyRnZR?=
 =?utf-8?B?M2phV0U4V1liYW9vTUtqYm5mc28zQS9oZWR4VEdIUXhqZ3NxTHZqZ3BxVTlL?=
 =?utf-8?B?cTVUMjJTak5hTHBjK1JkS0RDTHVXelBhR0twYlp5cWVYNmJhYVFCL1pZYWFZ?=
 =?utf-8?B?NkMxdytxdSs5djdxMVJDUGpkRk03Z2d5Q09icWtyUHZlK2poYVg2UzVHV1du?=
 =?utf-8?B?SDc5Q0Zaa1VEZDBSOENkTjMycWtJSmsxT1YwbWp2N2prQnA2SndPNXoxdjI2?=
 =?utf-8?B?bk1LSFgwejB6d044VUpuQ1gwYjVXeWtsamZVa1IxNHlEUWN6OThWK1M0M1lQ?=
 =?utf-8?B?bzYxeXJNaTVRcHdVN2NPeFYyQS9lSlR6RElLTzRUOU02V0p0U1lYdW9DQ1ph?=
 =?utf-8?B?bC83WjdWTVdCQnZaOUNVUE9tMmh4R0VYeU5ySit5K0g0aXdpV3hqR0kyeTc4?=
 =?utf-8?B?ZjZpUGY0OVVYWkFsNVhPdTlpVHJ1R3VqaFUzYkFqbElQQm82YzE1dmJYLzBx?=
 =?utf-8?B?QjUyUU94OWRKb0dKcnJ4VjVRYUp6OC9GTitVR0FrSjlvRkJraWtTallPbGRT?=
 =?utf-8?B?NHFYOWw4a0RuR3YwK3VVTG1WK2JXUENSMHExaC8weTIraVQyUEQ3aERBelEr?=
 =?utf-8?B?aEhHbkRzTThJL3BFSVlOakxCUERsSk1uRy9QeW1LYlIyYUt6Q1VVV3NNdVdB?=
 =?utf-8?B?VzRoc0psUlJhRm92SFRmS0lKZmk0NFkwak03blNIZ1pqRnpXZDM2WWxybWNI?=
 =?utf-8?B?dWRMckEreDhVT3FuYVV5NURCZ3NqVUhGZWpINkV1dTZqOW1nTlFDRFBFTDll?=
 =?utf-8?B?eXhpZVVENGZ0SUdmRnNtVTR0UVY4YU1XN0FDZU4vUGVZN1QramYrc2Vqcy8r?=
 =?utf-8?B?ZEdlTXdTMEp3Ukl4NGxYMzJXQjBobksrL05lNEJvdVQ1NzY5UVhZVjF5MUx3?=
 =?utf-8?B?OC9ha3BKUEZtQmVtbVRCUUh0L0VyRkp1N2hBMEVkSEY2dEpuNklLdFk1QVlE?=
 =?utf-8?B?d1NvZ01zSG1ZclpFRmMzQ2tsaHlLUWtHSUx2elhFenhHVzZwMTV0TXZTK080?=
 =?utf-8?B?djRxd3ZYQVVaOFlPTUYycEUzWUhlbHE3RTVHZ3NVWjQ4b1cyUUpMRnBjalpT?=
 =?utf-8?B?NlY4Nkx5ZVdscDJPcW10RndFOUp5SFF2OVZZN1FEK0piREhvcm8wMjEzUkJz?=
 =?utf-8?B?VStsY1FsQmpSUUZ0MDNVWEwxWStIbEluamUvTnVhTFNCdWIzVWRJT0dQek4w?=
 =?utf-8?B?bWw3cklJek1va243MmJwL09vMGttbi9BblZMMlQxWWF6RTAvRDFnUWpRQTY1?=
 =?utf-8?B?MUVQYU80dUFRZ2NPbVQyYVkyRk54L1hvWThGR1dBdERZeTdGZlkweTdtMWlP?=
 =?utf-8?B?SDRiSXBoQUR4YnJvT3NWVmgzSCtBd2VubUowT29qYTVWblB3ejRNdjRjOVNG?=
 =?utf-8?B?VmpFTDRVYmJocDRvQ2w5UmVZenZHNDU2NVJhVy8xOEFNaXpTNGxZekM2R0Rp?=
 =?utf-8?B?ZmlWekxnSGErenpqM1huTjI1TUtmYjhuMmJPcERlNDIzblhvYWhIeG1hTHVt?=
 =?utf-8?B?S29nSXNWa0x6a2tONU8xSy9WdVF6cmpYaXNXRTRFSEovVDRVL0FFbmdoNi9j?=
 =?utf-8?B?clpZOWkvZFlVZlpTTHp5VXBxYzNUSnVqYlN1cUE1OHk3TVJReHRGNVREeE1o?=
 =?utf-8?Q?P9d+npXB229u62UDJYGfSxr+U?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cIwTZQbZhDmljNqIIayjQjTCvg0DAF+bFivAQegCMmhuCkK9GTjY/I83RqurYyQD8VznwNorC41zk6oIRutb+ct/Jrllm8wwFqxglsZtoJ8lvtxZR12yaNS/rN9lSQvkmOIMZakmbGHbXAKYdBXU7kRxqEwsw5GgeWtgufyNuESAYmSoQJOfMxgFQeADG2krmD6Z+jv4euHY6VtxokXzROEvCxUb7EyU6l4hswtp+0Bl3P7BazFJiem9fNgeteo4pKZBIxaSn+C5uZNZ+jcVNEmGDvCAUdNA6+8pQV10M7Wyu/pv6KHA3JdU8RZMdbr7+IrTa7oAlPiI/0VPtbkHwgiRHavXIZI2f/gkfCAFB6WAtrl9LMopPNNKdverUM/EGikdqitOjlAKsdaDDQasDXk3es4nAraKbQpBCrp0GlD0N5uzvGIDXvTeKLR6hpVJ72M3fR2jdto16JIxPZ06pJ/tpf169X1Kb6fBqB+Vk5mNL90rTzNI+LAuAsmtKqdRISseutFZu0jjTOaFXPvRpKS7K0kQpR++LUTiT0cc9tuVrILweD/ohSBF3r3bBaGxfM3k4imFvrQ4GA01C66h9BEk+tzJ5no6pqPB/o73n9U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112799db-52c4-4cf8-1699-08ddc986ce2a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:18:17.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ixrELWY5MoL1Md3LlQdOwPT/vg7IWlzdyscRaDQPn6fO5wfqNct5DPuhRgTLnxUFGS3UNlh/3nf2hyPHak2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230009
X-Proofpoint-ORIG-GUID: D-GYeltw_RtY0wSZc9oqNLA3wcz-lm3i
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=6880385f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=KzIAQAI0oCKM2tI_sdcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12061
X-Proofpoint-GUID: D-GYeltw_RtY0wSZc9oqNLA3wcz-lm3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAwOSBTYWx0ZWRfX/CpE6k6X4X+7
 SbHCaVGrJ/+kyfqxaryDPvKcAbLs91ByDhW8cURFCQwbPtMr3ZhxtfsbPHxKHqCpdXOX0Q1JueF
 z3bmuEsgP1oQqahxB9GA8iDD43NRCzxU835czsGxmJKPRvGCggW/4VjMeq9ecNNEBwO72a7wMyz
 nE6HuMD3FhXVUPhSXTzmpI11/1Lotv/qugdVk1+7j6uT0+hPT507AKutE15qFW8SE54n958BPCn
 1vBliDZ8FAK51xhRDYtpd65zXZNVk4CslT7+RR6JEezl6hQoHmGXDqplQM9SWqsfFUkZ/vyQobq
 Vtwi1UyGswCosQzSTxdU9cW8p1kTHLJacyejIDnToTKZUmDhV6MetGv40oQMG54mCWdJXGo+lZ/
 Se4vy9odlV0Z0TA42sS8Su/lc5M3OsnbSPzhz0ddmYFHH0s9x7Bo7yQwkqCplPyRhOgd4CSI

1)  s/commens/comment/

2)  Am I doing something wrong with this patch?

$ cat x.d
/*
  *  // is this okay?
  */
BEGIN {
   exit(0);
}

I get stuff like:
         /*/encountered inside a line comment

Frankly, I don't get as far as this script;  I first hit such problems 
with all the copyright notices we have in D files -- that 
"http://oss...." stuff:

/*
  * Oracle Linux DTrace.
  * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights 
reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */

3)  Where do all the rules in this patch (tested by err.*) come from?  
E.g., C seems more lenient:

$ cat x.c
// /* hello */
// comment /*
// comment //
int main(int c, char **v) {
   /*
    * //
    */
   return 0;
}
$ gcc x.c
$ echo $?
0

On 7/22/25 18:12, Kris Van Hees via DTrace-devel wrote:
> Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> Suggested-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_lex.l                               | 14 +++++++++++++-
>   .../lexer/err.D_SYNTAX.boc-in-line-comment.d     | 16 ++++++++++++++++
>   .../lexer/err.D_SYNTAX.boc-in-line-comment.r     |  2 ++
>   .../lexer/err.D_SYNTAX.eoc-in-line-comment.d     | 16 ++++++++++++++++
>   .../lexer/err.D_SYNTAX.eoc-in-line-comment.r     |  2 ++
>   .../lexer/err.D_SYNTAX.eof-in-line-comment.d     | 16 ++++++++++++++++
>   .../lexer/err.D_SYNTAX.eof-in-line-comment.r     |  2 ++
>   .../lexer/err.D_SYNTAX.lc-in-line-comment.d      | 16 ++++++++++++++++
>   .../lexer/err.D_SYNTAX.lc-in-line-comment.r      |  2 ++
>   test/unittest/lexer/tst.line-comment.d           | 16 ++++++++++++++++
>   test/unittest/lexer/tst.line-comment.r           |  5 +++++
>   11 files changed, 106 insertions(+), 1 deletion(-)
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
>   create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
>   create mode 100644 test/unittest/lexer/tst.line-comment.d
>   create mode 100644 test/unittest/lexer/tst.line-comment.r
>
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index 9d502912..a7234800 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -35,6 +35,7 @@ int yydebug;
>    * S2 - D program outer scope (probe specifiers and declarations)
>    * S3 - D control line parsing (i.e. after ^# is seen but before \n)
>    * S4 - D control line scan (locate control directives only and invoke S3)
> + * S5 - D line comments (i.e. skip everything until end of line)
>    * SIDENT - identifiers and comments only (after -> and .).  (We switch to
>    *          SIDENT only from state S0: changing this would require new code
>    *          to track the state to switch back to.)
> @@ -46,7 +47,7 @@ int yydebug;
>   %n 600		/* maximum states */
>   %option yylineno
>   
> -%s S0 S1 S2 S3 S4 SIDENT
> +%s S0 S1 S2 S3 S4 S5 SIDENT
>   
>   RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
>   RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
> @@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
>   			BEGIN(S1);
>   		}
>   
> +<S0,S2,SIDENT>"//"	{
> +			yypcb->pcb_cstate = (YYSTATE);
> +			BEGIN(S5);
> +		}
> +
>   <S0>^{RGX_INTERP} |
>   <S2>^{RGX_INTERP} ;	/* discard any #! lines */
>   
> @@ -548,6 +554,12 @@ if (yypcb->pcb_token != 0) {
>   <S1>.|\n	; /* discard */
>   <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
>   
> +<S1>"/*"	yyerror("/* encountered inside a line comment\n");
> +<S1>"*/"	yyerror("*/ encountered inside a line comment\n");
> +<S1>"//"	yyerror("/*/encountered inside a line comment\n");
> +<S5>\n		BEGIN(yypcb->pcb_cstate);
> +<S5>.		; /* discard */
> +
>   <S2>{RGX_PSPEC}	{
>   			/*
>   			 * S2 has an ambiguity because RGX_PSPEC includes '*'
> diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
> new file mode 100644
> index 00000000..61f5961f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain begin-of-comment markers.
> + */
> +
> +// Comment /*
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
> new file mode 100644
> index 00000000..74d1d0ef
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d: [D_SYNTAX] line 12: /* encountered inside a line comment
> diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
> new file mode 100644
> index 00000000..8fe2ff04
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain end-of-comment markers.
> + */
> +
> +// Comment */
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
> new file mode 100644
> index 00000000..64d5ae63
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d: [D_SYNTAX] line 12: */ encountered inside a line comment
> diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
> new file mode 100644
> index 00000000..a9207693
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: End-of-file in a line comment is an error.
> + */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +// Comment
> \ No newline at end of file
> diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
> new file mode 100644
> index 00000000..f46fce3e
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d: [D_SYNTAX] line 16: end-of-file encountered in line comment
> diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
> new file mode 100644
> index 00000000..0332e1ae
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain a line commens marker.
> + */
> +
> +// Comment //
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
> new file mode 100644
> index 00000000..d1152afc
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d: [D_SYNTAX] line 12: // encountered inside a line comment
> diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
> new file mode 100644
> index 00000000..4deb66f4
> --- /dev/null
> +++ b/test/unittest/lexer/tst.line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: // comments are supported.
> + */
> +
> +// exit(1);
> +BEGIN // exit(1);
> +{ // exit(1);
> +	exit(0); // exit(1);
> +} // exit(1);
> diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
> new file mode 100644
> index 00000000..d4e4c325
> --- /dev/null
> +++ b/test/unittest/lexer/tst.line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe
