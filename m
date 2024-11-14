Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E416EB4C
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731614029; cv=fail; b=NtjwTdHH2/L5ZdUwllPEjeTm1k6+iKzitoizNZ0n11of3zQdyrx0LhhQWo+k5ymrX4ADGMcUTUa979JjEbmTI8F838YgK/ohyYesVJPaOOLjZKj7YZQm+PTRmIu/MeuodRUmbS02fb14Bqo7nNcKvVlMxtiYpdBz8X9IvyMyI8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731614029; c=relaxed/simple;
	bh=cptDs4o/8bJKjSg27jcYigwMmQZUpKLyFcN13JRZHgc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bRQmkF/JFa/8yHMI2sVu4zL+YhcmihJ5iNiKNev5u9E0p/H0hIdkypnxT/BItUluupT79UASMvGA0OMC/cM0ug2qCv8Djqel7mz1AesGScWsAzxWNVG8veSYNjodWwVPP3e2fYmj6xfdgouFeVrKk1+xKJytQJnIouKhwl4MDa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XUYFedEC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OvBry89p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XUYFedEC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OvBry89p"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEJfgwH008105
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 19:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TfYa706O2yCzSb7jpumGq9P05Z/7NV84A1gCWHrMoBs=; b=
	XUYFedECTySupNwWED3DpaG1tbQNBXGAwrWjc8opusizjnwSnqoiZ+LVFUDfW9NR
	4yDYP+G4+rGx265lR7cDQJQ0rYLNFVtkxIZV+3DkAOJsUdibylofyd97Mb2PTRXL
	2D3HnED7R1u9FsgMIgQ/Dw3YIxSRLm4CdkrtnbU1Diy2Ijs2gGiALe89V1rUI5H7
	IS704v6L87OQpDzoMF+R4JdOzM69rgTO6DNANpzQh71X3KpR8B1LJzz5N3PuJY5z
	Y80f3RLbhA7jEz+BpRXrAz5wFPww6SltM83wm5qyOPir/SSsdE3DWKPrOzgeLBVU
	AZvsA7cSK4cdKfPpgC4B/w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc261f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 19:53:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEI9VJ0000430
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 19:53:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42tbpapet2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 19:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEBOplW9LuUWd/zVNHqKfzx1Iwrl+ZXQg/YbZ6T6YPkt7noHgQDYYbrLPe8cnlAITwa+gZJCn6jFIEsjMbZ0g/9iv6lFzjwtueM0eQQ/IxpfPFd1Cgf7WLN5jm1wdzPbZkUkA31L0wgLmzh4eRYj1BBRI2JwLsJRBP1mnbarJhYVJnO5UL//+sO6CwdgWebn3cmLnosVcRvVBjEypOk9EWdxWRlpmLowhFhm54peI+UVQtxqYijI+t0hg4F94q3FP7B503ZDcsFx1SW0FSuyPeAVvc3ODmQTwhXJ6NaHGPSW0uqGYX3kaJ+bToCuQubtJcPMGnqwKpcJM4h9egA4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfYa706O2yCzSb7jpumGq9P05Z/7NV84A1gCWHrMoBs=;
 b=ZAuhurr//QaTHtI7q/NCDZbm6p6alisbM6m8/k4efqPQ58nPOc/F6MII7+33iAYxbaIaAkff46gnfta3Dzs0D+J71wH1S2hUGqKcDvtABJcHp8sGCye4SOF6Xd8989wgTdZ8hdmQQmr6Et3nk71qa+LXGBZ7BcKjDiOmSmmx0eK9KrXuD1I0QlPnJHRTcy39rNTdH3zyBIoMAFq5GbKdO80jVCpDAVzaK2NZLe3IRVpJ30V7pdISQgkkajeG7QuU4t8Oy+/jZ+ROxYTKl6XgULfqa2fMbE2lMxcyqkr6RbZjk8sDd5hablkXcUw5LvQMcE93FjXq/7Ac/1AaVTsnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfYa706O2yCzSb7jpumGq9P05Z/7NV84A1gCWHrMoBs=;
 b=OvBry89p/ssnGGgFWgbOLIFqSTdMYfqR36ZS6AxuXTujpyx2dAwmAyCxvc0Mka0r3b8AEAQ0F2xbvJrZYZTtgRAPiqjkGwZyGT6oamAB7ePXp5cS4yliLCIZ6EUVdmEooDSuQ8LZk9xla87pWkvCfcI2ePgJeXI9AqfuuRlHHZE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6679.namprd10.prod.outlook.com (2603:10b6:303:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 19:53:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 19:53:41 +0000
Message-ID: <07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com>
Date: Thu, 14 Nov 2024 14:53:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dtprobed: handle multiple providers in a single piece of
 DOF
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241114160352.47939-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241114160352.47939-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: dedb2c3c-6451-4f89-0353-08dd04e60a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0tnRW1kSEtKWUorbUZCOWVoS0VaU2dBVTh3Si8rS0t1THIxYU1YOTZUNm1Y?=
 =?utf-8?B?SnFHRzQ2K0t3dU1aNHFleE5XcDFjNEFDRnNWdjc2SFhMYjdod2o1TmxvOVRx?=
 =?utf-8?B?Vkc1SmR2VHR0b3B3Y3E5RTJxMHhuRm1QTjRaeEh0N1VLVHkvZkNqdUxZTjFw?=
 =?utf-8?B?TWpMcmdSMWFQMnBRMGhVZ2RVSkgxSDNWaUpVcmpBQzdvYWxKZjBSdWxWYUlW?=
 =?utf-8?B?OFRsd1NaQTJNYzBOdXdjL0tMSDRiaXYwRSs5aHBDbTFqaDBaWnlmREJ3QUVq?=
 =?utf-8?B?VzdWaUtWWUhZaEJ6NU1DNGZrTnJKMDhxOHpLZzFkKzd1Z1duOEZGVnBIeE5t?=
 =?utf-8?B?ajFuSTJXaUkya0ZVSHFQZTQ4TWdnWDErWlU5NG12Mzl2bVdMdGVheGE5c08r?=
 =?utf-8?B?WUNJRHQzcGRUQzc4VWwwUU9lb3o5WUg3WVBxeW1iYysvcmk0V0JOTkJaem5i?=
 =?utf-8?B?MHRncHVZYkhub3p6T0laRjJPaTZBRDRlKzV0T200NmV0MFkwSlVUMjRPS0ls?=
 =?utf-8?B?bjMzaTZNd0ZXeXFBaXRDaE0vMlJ6VUpSNG1PSmhmMzJ6LzMzc2RJNzRCeWJN?=
 =?utf-8?B?ZVliZVhCSHcxeFg4VzkrTnpUa0l0Wm5Kdk1WUGJqVktDUXU0emx4ZWRwOEl5?=
 =?utf-8?B?SGRNUGFBT3FqYnRHV0E1cG84dkRaMmlubWtqUktHTVdsa2N6NmtKRkp0eStZ?=
 =?utf-8?B?RG1tQ2pNelNHWGhUY3VSb1poUHQwSXN6bHkrMFN2OThCSC91Z1hTUnZCbzFi?=
 =?utf-8?B?THN2OG5YS1NHNDlmUEhkOG5mcmhqS3F6d2lhdENGeXdZaHVhaWNJOWxoUE9G?=
 =?utf-8?B?a2w1aTZKZWVhcEQxL1Y3SVNSTnhwb3ZHaGQ4S1VQekkrUHp3Zm5sUWJsUkJP?=
 =?utf-8?B?V05XcXdmcDIwZjNFcnFSUHZKRFVGeEppWkU0RkZyam9RaFhRNXpZd09Mcmdi?=
 =?utf-8?B?V0dOSFFSR0Zoa3lDWDE3NFVhVVd3ZnR6c3FxKy9DTnBXb1V0RTd3TVExYnpv?=
 =?utf-8?B?U3lZdk4va2JGWkR0YVF6eThQNGVpNU54bU5qSnNsMkVQYnVoeTVSMDRveW1r?=
 =?utf-8?B?b2ZrMEp4QnVZSHFzOE14cEkwb0tlbnpFLzAxemw1cU1mamhhREpZZFREdm92?=
 =?utf-8?B?NEE2eEZjWWkydDhIWEVuNDZxY25renhTSTB4cjd5SlNYdFA3ZUlDQkJ1UTR2?=
 =?utf-8?B?U0ZqbWcrZTVJeTgwYkV2akdQNmxnZ1gxLzFpV2dRRGh4aXJuOW82elQ4aXN5?=
 =?utf-8?B?TlNpL1U4V1dkQlJzbDVSZk5FNGRacHIvQ21NOENPeVVUSXhKY2wreER6L1dB?=
 =?utf-8?B?ekhvem9Wd0xXN2ZGQ0xlRlRadHRjL2VrNEhFdUNQaWNBakx4T0lSRzMzbk5q?=
 =?utf-8?B?WFBFdzFRTVdkMVJMaEpEMUhJQ2pibjdUem4wY0p2aEdKU1FLQk1OMkxsV3Nx?=
 =?utf-8?B?QkM0bHJKTURIRXp0VjNWNlhYUEZJVFoyWjB0aGs4SndOZS8raTJ3V2N5OHBl?=
 =?utf-8?B?VVE5YkRWVXhCcVZOa1hiUjRZejQwUXJsM1hlN3dQR2ZEYlJUV2Y5aXpCWWQy?=
 =?utf-8?B?QUdEYWhNczlCT1QxL3cxOWhsSnkwQ1pxeUNRWHR3cG9yNms2a25CYXViWGpO?=
 =?utf-8?B?RGgwUzVPQW90eFlFVitYSmp2WDg1YTByNjA1RkhEMVFzU0daUFU4eW1DT0k0?=
 =?utf-8?B?azd2RzVnSTZYZlBrRTdHVVFxL2NpcUFCZ0tMem1rT3lVOFZuRGlqMXd5SEl5?=
 =?utf-8?Q?9289lJButCmurAZCFzoye6MjmkMRU01Wcr5bDAX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SklWTCtneWdzaFFiTDR5bExGNVpmR2ZGSGt4Q0xLTlNSZ3hJYWlrN3BnUGhw?=
 =?utf-8?B?Z3dkdU1MMDM1eWxXQ3h1RytMNm1UUDU2UDByNU9wSC9CMTVyaVVuQTJDNjUv?=
 =?utf-8?B?akJTUlZNQ2dRdlpJSkZLdmZCdExNb21vV3V4RGJUZHVuS0ZiWkZwazZjT2wv?=
 =?utf-8?B?UUFHdTZpL3FZMEZTQ0FnZmdaNXlNeGVjT0tTS2c5V2xIRG1CVFRTYXBQUW9U?=
 =?utf-8?B?Mi81cTh1b3V1R1hCOGNrMHlSdnRLNjM4K2RsVkcwaTc0UW5vTWFTRlZab2hk?=
 =?utf-8?B?SUxITHJvSk1iVUZnTlZqSWM3ekNxWVgzeEozdklPMTJqWmVHckhSVkFjWlBO?=
 =?utf-8?B?c0VUMDA5TnpJaWdZRHdsM1daaVd0SFgxSGU0RmtsTEw2MVkyUW4vbVU3R0xF?=
 =?utf-8?B?eWF0Qzc1K2p5YmR2ck51TGdtUFJPNnlNNEJDNzZRVWwzdmRRWmo2K2VGa1hp?=
 =?utf-8?B?TzUxaDVEazhZWXAramRSend2UFJhbEZscGk5SUlLRHlqVjB4VmV6RXNNaVoz?=
 =?utf-8?B?WFE0NkNlc3pmMTMvVUs5ektCTUg2R1ZZUHBjcnRlTWkyOFFDWWlncTVDdktN?=
 =?utf-8?B?WW14Y1U3d0czTG5RTDB5aU5HK2RZb2M1Y3EvdHluR01mT2VEWGU3Ym1ONmli?=
 =?utf-8?B?QjgwMDk3WituekI4TytXZlhSa1BkRnZWVEdGZ3pXM3YvMWhpeEIwOXBYK0tC?=
 =?utf-8?B?cnZzeUpNL3UweWE0SXR2UHlzUkN2UVR3K2dSSi9CY3c1a2NKa2lNc1NWVnNS?=
 =?utf-8?B?QWNaYk5KdzhSMnRwcEY5MUNWQVY0bHNGM3ZiSGdGR253T3J6OGlZemdEL3VM?=
 =?utf-8?B?QVZmNHlESFhJSFU1UG9Qcm9iakl2RkRrVUUzaUFTQ1cvT0lrMG1mZWJNQkZD?=
 =?utf-8?B?NWxIbXdVc054YVZPMGhza3VyTEIzY05DTXcrSzVIa3FwbjVCdFA5Uk0xMFZl?=
 =?utf-8?B?Ukp0bkUrNDhsM054YWRzd3VOM083M3E4T2FhdGJRZUNhTGpJMFpSeTNxWTVk?=
 =?utf-8?B?MUQ3c2xVRkpQRkprckR0V3JIWG5WaldvTllleGc1NUc3aGVqTk56dk1TQkdx?=
 =?utf-8?B?R1l2cjQ4WlRpMldaOWYreE1kZml2RHF0ZFc3Y0NEaXdYeElUSlE0QzVHL3E2?=
 =?utf-8?B?T2h5S05GRkxNbVptUnFsclpieFpjUEplcGp6dTBRcDcxS09TWWEzOUVhcUNZ?=
 =?utf-8?B?QUc5SzA4RmpUNU1QOE8wSkNBS2JwUUQyOVlxRGczY1l5WE53WjN1bGlmM0RU?=
 =?utf-8?B?dU5aQktRUm9hSVhqVE0xNVF5UGY0VWF0OWpzMEYzME4rRDZIR2x1anZvaVdx?=
 =?utf-8?B?ZWJUSHlYOEpncUVlUlJVTHd1WW1RUlNDWEFpc1llUUR6Z3FBZUxrZGtUbFFB?=
 =?utf-8?B?Vzkzc0R0aXRoZjh1a3Q5dXNNQ29OMWpiOU5FMnlGKzV1dHJxOFFha3J4QWtE?=
 =?utf-8?B?ckNHY3RZTzEzTHp6QVJlRno0am1lbEM3RDlMZXhKMTEwdFJEVXNBK21QZTN2?=
 =?utf-8?B?eHBwU2ZWQXdtNjFpa083NjExTW54ZHoxbElURjVBdVFWbmJpb1dIL3JNYmZS?=
 =?utf-8?B?ZVV2QU1MN2UwK2dBM2N1MElXS3F4UFluM1JsMmQ5dm96UGs4OHhPV2UzNUE4?=
 =?utf-8?B?K1VvaUNhWjJxVmFNdUdCajNmTUMyd1FCRk1acWRxQ2NBaVZmS1dxVzY5cHlC?=
 =?utf-8?B?Z0xsWHRyazJ1R0l4bC9iSUFRTUNURUFKb2VtYThLalZYOTdoUjJlUHZUMHRE?=
 =?utf-8?B?RG9hRUpMYnNoNmE1Nkl6RTBrV2ZGNkx2VlNsVHB6dElvVmhMYmpPZWFxTzhF?=
 =?utf-8?B?YTI5U2hGZ2FqTFg5TXVZSm5Ua1A2cUdYN3VMb2dmVUt1aU9GS3M0ZU55S3lq?=
 =?utf-8?B?d25SVVltZjhHeTloK1hqazhORVJzakNIazR3bXJVeUt5MklYL0xybGw4NE1u?=
 =?utf-8?B?RnZNTzFsN25LSmFxaDc1S2t2M1hBMEt3SWlPTDdHLzU1amxJeWRZMmQ4ckRH?=
 =?utf-8?B?TEZkcG5aVFdUWE1ra2NvMUk0dWZRdUhOZnJIK0NybFpBcEplS2c2N3NyajB0?=
 =?utf-8?B?U0Rad1h4YWhaY2lWZ05WWWUxaWR3QjNkTXNCUFJiSGh5N0FIYi8xNkpjWGVh?=
 =?utf-8?Q?d4jninjRakVAmIRfdGQnp/9it?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1pgDcbV8kYB6QSExsZh9WDV/TdxfvzbHjYIVQRrzd3i5hEJ3OBfzVik/YVoSxJRe/mwVh114JbV1WG9nIbDmYwvizqV+E+VrzcFzqww+NbbhYsQ7fUr0EelY1ACp5tlMn3gGfDX3N8eM86vPOGxxUGuDxeixkHWIU/F76bdBanw7zUpJhsWhKys+GADbeEUtDrH0p+e6zt+voLSkYHBbFDxLVtUmrqbcqrbDPYDe2pGNHgm2t1QktQ99x/W19NSIXXOwTcv8QMce1KyQ19zKKycW4iS7vsVaXrqUlWWPAE1jiRGdgnIXGOtZ2fDzMhQdj8F83ke7S26OpnFQ1S43XV/hLCrNKN91zbnZHBEwvwIOMJxGC1gynG5jWLVkuFnMwfMd48kHcwLs9yop2aAsxeiMqV/WUYntWsn+vsUnYFpX7R1OSTP3DRKf6/qrQeMPNKIfAFnzAFd21DPiOCRILcVqfU9JRLdJH3pd9vpF4r8riRJVMkzHrVlcbUes8PJMeDLXmQ7hc5G3AWCazRJAPjg3UAE0pKRVCl3QH0kNSG5he9d1qF2UjEbcXk+12rryW9/mX6jpH5ECptrF97mHzZ3gbU8IzJWgD2Hnsv+ZW/Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dedb2c3c-6451-4f89-0353-08dd04e60a09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 19:53:41.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYS1Y7XcGKghUfGV/GNxZbbnzmuJT2kmiZBzt8jlhNL2WULyEv5dq4DueABM7aAdrg4IEHtPW2VgOQCxak6nSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140155
X-Proofpoint-GUID: u3o4_LawtybNrcVygNy7FAJup4ShtFBb
X-Proofpoint-ORIG-GUID: u3o4_LawtybNrcVygNy7FAJup4ShtFBb

I'm not familiar with this code, but here is some amateur feedback...

On 11/14/24 11:03, Nick Alcock wrote:
> A given ELF object can of course contain as many providers as you like.  The
> DOF stash format, DOF stash management code and DTrace itself are all set up
> fine to handle DOF with multiple providers in: but, alas, the code that
> reads the DOF from the parser child in response to an ioctl() assumes that
> one provider is all it will ever see.
>
> This is not ideal, but rejigging it introduces an interesting problem: when
> do you *stop* reading providers from the parser stream?  Right now,
> dof_parser.c loops over all of its providers and emits them until all are
> done, then just stops: there is no indication of how many providers there
> are or that this is the last provider or anything (though if there are none,
> it does try to send an empty provider to avoid the caller blocking waiting
> for a reply that will never come).
>
> It's a bit annoying to try to figure out how many providers there are in
> advance, so instead of that, take a route that's easier both to emit and
> parse, drop the empty provider stuff, and simply add a DIT_EOF record which
> indicates "no more providers expected", which is always sent last.  (We
> stuff this in before DIT_ARGS_* in the enum because it makes more conceptual
> sense right after DIT_ERR, and DIT_ARGS_* hasn't released anywhere yet.)
>
> With that in place it's a simple matter to loop adding parsed DOF to the

I'm not sure what this is saying, but how about adding a comma right 
after "loop"?

> stash's accumulator until we hit an EOF record.  Memory management is
> complicated a little, because a single parsed buffer (reply from dof_parser)
> is now owned by multiple accumulator records in the stash: but every one of
> those is terminated by a DIT_EOF, which appears nowhere else, so we can just
> not free a parsed buffer unless it's of type DIT_EOF.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>
> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> @@ -24,6 +24,7 @@
>    *     DIT_ARGS_XLAT (1, optional)
>    *     DIT_ARGS_MAP (1, optional)
>    *     DIT_TRACEPOINT (any number >= 1)
> + * DIT_EOF (no more providers, last record)
>    *
>    * The dof_parsed.provider.flags word indicates the presence of the
>    * various optional args records in the following stream (you can rely on

The new line has indentation inconsistent with the pre-existing lines.

> diff --git a/test/triggers/Build b/test/triggers/Build
> @@ -13,7 +13,8 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
>       ustack-tst-spin ustack-tst-mtspin \
>       visible-constructor visible-constructor-static visible-constructor-static-unstripped
>   
> -EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
> +EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
> +    usdt-tst-multiprovider usdt-tst-special
>   EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
>   
>   EXTERNAL_32BIT_TRIGGERS := visible-constructor-32

Okay.  Introducing a new test/triggers that is used by only one test 
is... well, I guess it's a judgment call.

> diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers/usdt-tst-multiprovider-prov.d
> new file mode 100644
> @@ -0,0 +1,12 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@skip: provider declaration - not a test */

I don't think the @@skip is needed for something inside test/triggers.

> +
> +provider prova { probe entrya(); };
> +provider provb { probe entryb(); };
> +provider provc { probe entryc(); };

We should stress test more:
*)   multiple probes per provider
*)   some probes with same and different names as in other providers
*)   probe args (including probes in different providers handling args 
differently)


> diff --git a/test/triggers/usdt-tst-multiprovider.c b/test/triggers/usdt-tst-multiprovider.c
> new file mode 100644
> index 0000000000000..430c0cdd2cf4d
> --- /dev/null
> +++ b/test/triggers/usdt-tst-multiprovider.c
> @@ -0,0 +1,22 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * A trigger with multiple providers in it.
> + */
> +#include <stdio.h>

stdio.h not needed

> +#include <unistd.h>

only needed for usleep()

> +#include "usdt-tst-multiprovider-prov.h"
> +
> +int main(int argc, char **argv)
> +{
> +	PROVA_ENTRYA();
> +	PROVB_ENTRYB();
> +	PROVC_ENTRYC();
> +	usleep(5 * 1000 * 1000);

usleep not needed and just taking up test time.  It was originally in 
some tests that were checking /run/dtrace "manually".

> +	return 0;
> +}
> diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt/tst.multiprovider.r
> new file mode 100644
> index 0000000000000..b83f559a7e7ff
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.r
> @@ -0,0 +1,3 @@
> +ID provaPID usdt-tst-multiprovider main entrya
> +ID provbPID usdt-tst-multiprovider main entryb
> +ID provcPID usdt-tst-multiprovider main entryc
> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
> new file mode 100755
> index 0000000000000..ae8493e3d5be4
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'

Okay, though the "grep -v" would be clearer to me if it checked  '^ *ID 
*PROVIDER *MODULE *FUNCTION *NAME$'.

This whole thing would be clearer to me as a single awk, but maybe 
that's just me.

Comments might be nice.  I'm not sure how comfortably people read 
regex...  I need to concentrate hard to figure it out.

> diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
> new file mode 100755
> index 0000000000000..d5b72c2be77ec
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +
> +exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider

Okay, but there should also be a test that actually fires probes.
