Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF322339
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724120067; cv=fail; b=el/Y1DPkPI+B7zFop8xQ1FcIBeWwkijDBUVARwkt/NsUCk2RStjBQYYYUIpJfomXA/l64hiyMRMERdfxqaTgq7mLakQ7qxDVrB1LGcoIcQaZ1lrZOOMHfSoG4j0PilaXo4l4ZE7upIQxmdwI/lLF8bp/1UXTH7KDP8eKxxpMHjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724120067; c=relaxed/simple;
	bh=2y9v3QL7Ze2rp89JovnMC7Ut2QFcYsvRtZqcNjNe3xk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=khvSRRvo7RpF6zxqvqEdY87kfm98uwK6IVZO2/qk4k2qi/8nwug8lkpQHaNp57Y0xO2BrfOsICTqLzYYitr4gbVku20cM9I/FPoEudccU0B/809qsAnGbIq3m0eHZGYs3xG2qebwmTa4+hOLZOkCBJG2JMABQbJ2Ic6oznKu03U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cpk+oATt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=py3Kk/WJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cpk+oATt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="py3Kk/WJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKJxH016550;
	Tue, 20 Aug 2024 02:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=P2Df2LqC7tFlcPKJRKq6Qj5Ejg3MnffzdPNUCIqxdR0=; b=
	cpk+oATtadzLxvkj04TMjHkII4KuER8e2FFyGmiJizXdc7M/3DXAq0GnQ9gYbC0e
	qZJSmdS+XN6QRq3LQpFXIWKG/QdR+FDV/J4eTsDOt6MwDUnkYv6LLCdHfKJNq6Uh
	+eXf9X9VHU4mL0g0dVjeCg+nSo9yb8r0vRGm2R5GVHsu7gPP6Xw5OxfcDEX6oYxx
	uYe1QcQ3sdIW5AT+PcHDVICCSft2kS+deXB2ZrXXWtZVwU0wkxr7XcNveXid/X6e
	LKul6XOgo+JFCQ7qpYRG2J1cm/qCfuKDgJiOPGWbBC8wguMR26umCWrE9f27MM+R
	CfwjuPEm6ivLZryCqv7lzA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdsux24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 02:14:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47K1EBjr029147;
	Tue, 20 Aug 2024 02:14:14 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414ha5s318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 02:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+2p9+w8IT2Lzb79wTBq6f63y+QlyR38aWelrxVlPZXaN62KuceU0S96eD+v4721MQbcpn+qwEeg6L3XGvi3Ts0MiwHa7uqZxYhvKo7GwyLoobk225CCtYyiTen++qzViY5lgaoeKzyTTnaEZyt+gmBIWFpONmbWUhC1MHjGjUVR7yKen9GcHN2P5nG2cFdMyxhZsSUDIzCiZxQhT69ungMintgB0ldkNplyIvFNxLy36ktZbUgscvE9WEPBVNKrW6m9r05vN2AS38Ou++ETGC65Z3Hc/atQ95YCh3Xo4qBHTdvry9G39mKQHnGfSEMjvD3kg7KFWm2uQPDrocKD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2Df2LqC7tFlcPKJRKq6Qj5Ejg3MnffzdPNUCIqxdR0=;
 b=Bi6zxB7ENrrue4nATdftpJjrn1AI1gAvbdmlILM8IEDQrOX5NNuEicOYhsnclGI7rdexsBrF+Ne574K18kDuzVEcRZ197nY3o2AFUjZZR7zjkQPlTp2ChhJN0ijp3q+kFSpMcmlk4hcDvvRTpEBmU70OPULjHki9kauPCtIdPtXbZSyfmwYN4PyAZQz0QrmK6s1m4sollqZ1IsaeZ+djag8hRkH0IzNZndcqj+8L9IM0C3B5L90rde7VquP1+3XZDtp8mDPQmAjBRb7FRKhuPgCJDXsEEia4nZZCuOmBrFkKntewZo/VD+bGjqh6lRnmTEzzqQb/9oB+Z/wA/Gr4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2Df2LqC7tFlcPKJRKq6Qj5Ejg3MnffzdPNUCIqxdR0=;
 b=py3Kk/WJ2MV1W4W9rKtBa0mCS+o/BgSFU4RXJC0DFCMFZfcUDhxbUvXhp9Yxgq+ze76SNKtakD3fZU9AwgtXOSlhvLMgcWqlh4ijs6R+xsmxSdQntHjLkjWUqJ7Qv2JIR/9JjnCIyvh/lOVt5fT7/gERVMa3pB+XXYxctOva61o=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CY5PR10MB5913.namprd10.prod.outlook.com (2603:10b6:930:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 02:14:12 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%4]) with mapi id 15.20.7897.010; Tue, 20 Aug 2024
 02:14:12 +0000
Message-ID: <7dd215eb-b42a-558c-d730-d45bbb434a7e@oracle.com>
Date: Mon, 19 Aug 2024 22:14:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] test: fix exit code in tst.newprobes.sh
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1724112622.git.sam@gentoo.org>
 <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::31) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CY5PR10MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a82242-5d20-425d-a100-08dcc0bdc882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXkrbDQwYys5VGtNT0M5UTZIdmxsN1dUcy9XenkyLy9scnd5S0tQdWtXcjQ5?=
 =?utf-8?B?djZoYkVUV0xsVG1QbG1JUGlsdzRHa01odjJGd2llakN6L3pPL3NTYjJoMUtK?=
 =?utf-8?B?Zk0wQXFObzJFUkN3WEJZS1hRSFlod01rOUxrQVg3bE1oN00yamU0QTdnSHFo?=
 =?utf-8?B?NGNkc3A1ZzhhUlFIK3RLS2NRUnhFVDVPRldVOFpycU1sWjROek9WVzFVK0di?=
 =?utf-8?B?NUNITlBKY255SWxDdDNpcCswUzJ1R3krdkhUTTk1SlFtbFJFTCs1R3AwVTlJ?=
 =?utf-8?B?VHIxUnllencreFpUWnpnRUxDTVZyRkh6NWtYcnVEN3N5b2RMTkJoU0ZtMEF5?=
 =?utf-8?B?OU53TW8wdDlWa2pGa2VDN2NlTkNjVnlRNUZwZDl2bk9lYzJsdVl6MlNSTGVV?=
 =?utf-8?B?SnJIWFlkaFEwSGMxME55R3M0dUd4bUFMWnZScHMwVG1McDVSVTNyalk0WlFs?=
 =?utf-8?B?bHE2UHVKcUoxaERiYkpVS1h4ZTVDeE1nV1NaOWg4Z3RPcmNzLzNyZ0NENVRs?=
 =?utf-8?B?RGxtdWlrRDBxeGluOHNSUjVqejE4VGhWMHBaT0t6YW0vV3NKc0V5cCtUQ2Iy?=
 =?utf-8?B?MTJpMlp1Mi9udHROemlMMTM3STcyZy9XMWZnalVoNmZLQmppN2MzWGlwaDRw?=
 =?utf-8?B?WlFVbVRkZjdGZThCRHpBTzM2dm10RWZBVmppMEZ6cjJGdEtlZWdob3d2VkJs?=
 =?utf-8?B?Yit1V0k4RmdGS2pSMjlPL1RpOEJXWXBDVmxUZHkyUzlDcHBoaVoxOGJaOHk3?=
 =?utf-8?B?V25sMWhMSzZVYkp5Ui9INXZHOEdqaFJPdE1NanNxZEhTUmZsMnZVdllxa2lL?=
 =?utf-8?B?cGtOM09pUUdwRXRkcUx5dVJ1aEREcHptVXNxL3U4a1RUSnBJSjRKTnNLemNO?=
 =?utf-8?B?c0N0c2VLc2hVb0xwVk5wZkE0dDV3ODlZMWpZUnlDTHd4UCtNZTdQVE1BUTB2?=
 =?utf-8?B?R1BMcXQwdEJOc3E3NG1GalJBK1o4R3h6TjFHSmFRQ05VR3gvSEo5b1lubFpO?=
 =?utf-8?B?VTY3eVF5bDNuWHlpUDVVTWpFWEJkRG44TVE2aGFFdVQrQ2ltTFQ3dFJia0Fk?=
 =?utf-8?B?dkx3OFhxMVhDalV1SUo2NktLcE9aZ2tCMFhoZHJaZ000NHNBUDlPNmdlWUVE?=
 =?utf-8?B?TFBVRVlRNkdhWG1SQjloSXd1cjRPYytFTDdnUVduM2p1TGZWZGkwNmFDVkdp?=
 =?utf-8?B?a3B1ak8yR1A5Y0lWM3RVdGRjSUd1YURJRHNEQkVEbTdwQStjbWpyN2VTWmtU?=
 =?utf-8?B?Q0R1M05EdjUwOW9WUjM1L0pod3FYVTV0bjN3N203aXJ6UTM4dldqdmh3aEJm?=
 =?utf-8?B?eEFtd0xtU0lKK3lyUitUT29JN2E5Nkk2bTRzOFJYUWNybkhTYmZMRURCa2d0?=
 =?utf-8?B?aU0raGd3THBTWXhoWWhsbmg2UXRYQ1NDeHJFS0xHUGYvS0dIQnlQdXhjdGZm?=
 =?utf-8?B?ZzUzRkNrMkdpcEVGa1AxTUtXQy92c21OMHNCN2RwU1M5bHpQQnZrL1FZLzV1?=
 =?utf-8?B?MnJZZE82NFFCSFc1UmFRYWRKRU54VFNRb1oxR3crcHBucys0UVA2Ump1eis0?=
 =?utf-8?B?VXZieWFWRFBhVjM4NXp6clZWMFBCUk5hN29tRFBMSG1yVVBhNUJFTGpnQ1BG?=
 =?utf-8?B?SE9abnNKZ2cwZmtyak9oMVFRdld6RDVCZGJQRXR0Y3g4RFJNTGhKRkptaTdW?=
 =?utf-8?B?VkwyNmVYUzdoUXVJalR6NUFDQ3dweWtEdDZhNFl6VHdxN0d6OHpXREI4NDhi?=
 =?utf-8?B?NVV4N3N0a0xreElsdTV5b05JU0Z1TUtLUTZmUG9YZHlQdmxmUGpYcUlwS2Rx?=
 =?utf-8?B?dXZQT3F6c2NVUm51QzNrZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk5GTURBTE53TXIycjFBY3NNQjA1dUREV3lXNndLd3NPL3ViT3hKNWJvTWRE?=
 =?utf-8?B?NFY2QTY3dVdxZUVyd0s4UFdrdzdyYUZqRFJ0MTJYZVZBRlNiWjZsN0szN0gv?=
 =?utf-8?B?SFZQMnNmcVhadm5mdnZSY1cxTjJMeEN0a21pRitRakIyMlpZVmVmV1FUVWxs?=
 =?utf-8?B?K1BOSXNWUzFxVHpqajBQVXppNTVTb1o0QmJ5WE5UOEhKeTljZEV4RkZpQ3RR?=
 =?utf-8?B?MVp6NWlNeGJvV1JLQWtUWWlLSjRtQXVYVU9GbVozejFCUERFNVpuSzhXSFpD?=
 =?utf-8?B?MjZsdXZPNHJNMG1mclNMVTI1RzMrQVRhbHdRZFJQUExkWEJpYjgzRDZhaE9J?=
 =?utf-8?B?VXFvbHdHU3pEL2grRkJUQmpDT0wyMFMweExEQWJNY1p4azQyeDBTbDRrTks2?=
 =?utf-8?B?b3ltWjljN0Iwa1l5NXlXYU5UNVl5KzNxMlZOMlcrRDNZbFYyZEdWcWd6YlZZ?=
 =?utf-8?B?dEpTZnRmR1Y3WGpCVko3WEl5djlQdk5BaXJQWENISXRJWjlQVDBnUHBGQkFt?=
 =?utf-8?B?SlNpTjZXQmFPaWpDdDBhQXlScnE2QnE4bnk5Nk5QQmRUYTBFdjBoKzhIbzEx?=
 =?utf-8?B?U2h5L0tXRnMxM0VtT2VwdXBBbnZsOTVnL2l6MVZxbmpOSzR2UGNiWXNCR25r?=
 =?utf-8?B?SnZKREhLeE9rNENvNWJLTitTZTZtcXhYQVhZY0NnNHl2eWE3N2FWaGt6dXZE?=
 =?utf-8?B?RTU5YmFOTlJJa29wS1NHU1FDbjV3TW9DMkxXQ05VQzkwbFBpbWtpMVFLaGVI?=
 =?utf-8?B?S3Z2RTU4WE5lNGVYc1RrckRxQzd2RmEzaS9WbU0zVWhUdFUrNUs4NXJSQ1R0?=
 =?utf-8?B?NUdhdmNwK2RlQ2hRUStaKy9jRTU2L1V0SWxXR2xzMkZ0YkR0M1krTmo1b0dl?=
 =?utf-8?B?aWNTRWFLOCtLbGNKMzVOdFlTaG1uTTVaYmF5Vkl0bUtiNGNyNUEyZVBUTXp1?=
 =?utf-8?B?TUNhZEltQUU2QWhoMHRXUkhOVWhValFuOTN3a1RidjY1YnJ5M2NrNmx0TWox?=
 =?utf-8?B?N0xtREZtZVBVdzdCRTVCWjBJdmdHL1ZDNTFLTlgzazBzRVhJZ2prb1VjbTE1?=
 =?utf-8?B?bm5LNjZLZm43TDczUTNrTERVbHdRZk5RR0I4UTYwbHd5b2JYaGo5NzBRMlE4?=
 =?utf-8?B?TUtJZ1pyUGNFRHcyRFBqaGM1V1p1dTRIdmY0OVFrVS92MmZ2bTgwRCtsdE53?=
 =?utf-8?B?bjFnQURNSHA1Y3dBeFdnRk43Yjk0bitsQUNjdWpsWHNmVk1Fbk1IaDdTdUsv?=
 =?utf-8?B?OElHWi9PVitZZUM2MjBJMGFhR3VFYUpPU3gzNGRvZlNsZjE4cHBMZ0pWbzlZ?=
 =?utf-8?B?MVRXRWEra3FiQ210VDZaRTBqSUdaeGh5V0RlNFZ6MVdJbFdCSy9FMTVqQnFG?=
 =?utf-8?B?Q2YrelBqN3BEaTNvcW1sdlZEM3BFY2dZbm1yQ0IydmRMWWZhTElYNE5BS1Jt?=
 =?utf-8?B?V0I1SjJjL2QveXhsT1c1R0dtS2V2aGh3WVNNVWphMGx4YXFEL25GdDNRNkM3?=
 =?utf-8?B?blY4NlBxL011OGM4cU5aOW9CUXp6UEM2TGR3eEJ2TW1uTGl0ZlptV3J2NjQ3?=
 =?utf-8?B?WTJtM1YzZll0RHZ1anV3SWc5L2E3cUVTU2JsVit5YjdwSUtwRG92M1RGZG15?=
 =?utf-8?B?UXAzUDFPTWR0NVpRMFQrSGR4bmN2V29yYXI2SElVL0UvQ09NTnhyZFFDWmhm?=
 =?utf-8?B?RWhWWDhtdXJENGlxYnUwOHBSWC91b0U3NFpucXZkOHFTNmRWVWZHWlJ3c1FB?=
 =?utf-8?B?OWVZbFJjMzRhZHJrdmlwQ29RcC9BcW13aUYwamR5NFFEeGVVNzl5OW1IdFJI?=
 =?utf-8?B?QW9OdFRQcDRmYk5MemhoRE9yN3Z0dHhnd2NGWG5lWHN6ZXM1WUNtUllUcEc2?=
 =?utf-8?B?ZzV2RTVSTTRwbXJ2bXJVVGVIWHJtTG1sWWtScldsRThBQlE0ejVQeXRWRVlt?=
 =?utf-8?B?SW1FclZuVXZ3aW9hQ0V4anQzaytialllUjFYTzJzTzVKV3JVQ1hXZTBQQWh0?=
 =?utf-8?B?b2tZcE9LcTBXTS8vbFJLaE1HZkNNbjkwcFZjT0wzQWZaTVI3NE9UQm0yVkt6?=
 =?utf-8?B?dk84Nko5NzM5RzZtOXhpYU5Wc3VhTVJURHpFQkVXTlB0b1kzUXkvdjBZUUFK?=
 =?utf-8?Q?RfqX7/LUD29SIWJL6/59Rt2WJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tV8C74wHfiYcoclEXBVfLJLqvnLRvUlcleqyVlH4YXlqU7uxiQ3W/0JTGqIPPjNbzsXaHB9JVCyT3dRu/lAgL3Ygwz1y3/FWYit73QbTli9sAa1EPWvEy+t2Deq5EIW+Kq9ObcEDft/YkXTz1buD5aim5L+kH1Wgjp73nMiRGkSsklAZyxrSEt26W9T9ITt4Y6eh+oAe6/9JErJ41OmMJ6uNJDVNHL7DBwU890srwbWrjKf7T0BZsOVbQjorvSSHtKqZDdbZaEhYi9O0SaT8wj+DqazHLxAQjJfKyEJUk70dYgTkLeikQI+H+/d2XKsm1yEBx7Sr4aHe4iP7O5dy+oErTjAFYbEydxGLDZHsh9MvPjAaTTXe0jglYGlmXK4ElwcCYuJ0IunokxaMyeKG9Mh2BWYMLwdf5SXRqbS1mG9uDQ9U+WJNIB33rGdtx/LXV1tFKc31iYqXE8NUD+kMrnlyxzHxqYNpRnHhUMyi97HYxNYBEEKkP4jgfzKkzTRzXojvZo3pOo3SRUe+guPRc1z+Ul9H4KECBMZoa7TfE5EjWN81d2nSqheXl4ih3dozCwZRLOMxTebKyjfKPrsZsRKyj/RzVknJeO0mX6CwvhQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a82242-5d20-425d-a100-08dcc0bdc882
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 02:14:12.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+doodBTpXkwDUExGtghz94hz8hS/OaiUqyS2z0XqcHcQ1tMO2a9eJk0kZk+bLCq/KPayAqc/FNa+0v2PxCsiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=927 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408200016
X-Proofpoint-ORIG-GUID: Mu-zLDoM6XbwhGyL2ENeP2oyp2YQ7YI9
X-Proofpoint-GUID: Mu-zLDoM6XbwhGyL2ENeP2oyp2YQ7YI9

Another question about this test is whether "pid*:awk::" is even a 
legitimate probe description for pid probes;  do we allow wildcards for 
pid numbers in pid provider names?  Anyhow, that's a separate issue from 
the one raised in this patch;  it does, however, perhaps influence where 
we want to go with the test.

On 8/19/24 20:10, Sam James wrote:
> $status is never assigned, just use $?.
> ---
>   test/unittest/pid/tst.newprobes.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
> index a4944688..0980d3b3 100755
> --- a/test/unittest/pid/tst.newprobes.sh
> +++ b/test/unittest/pid/tst.newprobes.sh
> @@ -44,4 +44,4 @@ tick-1s
>   }
>   EOF
>   
> -exit $status
> +exit $?
