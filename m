Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3044F20E
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726248073; cv=fail; b=YXAFu+c17YXvk5rLh7Q6zig7ynG7ux0sx9U8Szs9dj3r34hmr0ijixeGZjxrc5j7z2bBepKJYiQMqFz5Df30xfCgz+bLQd+5w67rod2ajs4cWWdIHqOma9r88rbB+zzrWTlymPkZP08vi4xr6E3zANMLS3Vkj0XMsBMWVNEDCt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726248073; c=relaxed/simple;
	bh=D2jPngsv7LlaPQFgtBXGW/5RvDmlNyJ723UFRwdgZJ0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ehAZmoPtc2iQ01rT3hT5hM5+vPNXuWiL1H4xlhnlKKhlnrpmSX16MjDfTclhwkQOMljuFCktH8b1j/+6565ziybZTCwvgTVsNsodc0n8MtiQJJ44zrAu86RN7Cx6tenmxeIhD0cqkL8iAJMVI9FxUrNlUEOLiQeNb4RuxFDEAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AfGMYwMB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eor2i1X6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AfGMYwMB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eor2i1X6"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DGdNGm012260
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=kw9AsmIRx78XlxjcbPXzWr0lz7NpSvw+chXK32Ooa3o=; b=
	AfGMYwMBYsOGP0b9Q9c7VjUtxwiDPqdumywTkiEodXdl1RrGZSDopM7wwBPCZYhA
	/ioZTpXUpzJdTBt6DjFehJrGimqHpLwMPBe4cZiodzXRVWUeBIVygcPsYAhqXIyw
	XhSw8T7hZZuCYmHe9n9wtBpWaUpHzmByT80DoRfksYRbFIsz2ET6SkLFakUQ9nEg
	UlwLuv4dWGtcu1i9cuEFTuatY+WZL3R95InuvcDcqkpLhCI7A5jyrGSnZ3mnBse9
	3BPM3sIeqo/s/H7h4h9Ga5XNaCVuL71AfAoojl5pIB2KSh2TutzGqwlO9aT/ZtK1
	HRhuSre4DxALZ1uTMxUGEA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gfctp66f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:21:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DH082O006225
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:21:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9d0ga4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0KAOnnavGMAYY6Y7hbgn/7v3DCosiwUBd6U+TnmBMjmTPhw5ufSzk5vSzfr/piYgv0tw9Z6Ks6AQUezPudS6PlAFUCTO/MfPe1hRTu/SU8MmgKQGnMWBMiFh5pv94mffU9RhtQR6MWbNqcGnuD/38IGunLpGXuiAImQGpc70PNvUyKV1fosQJp48CzAeD3yp7MiqiQmavSPCNJA/EP4afuYQ1C7pLFogGathSFdHb3LvB8IWerpcpKVuRNhj1YTpEWG5Lyon8mY9XNAL9H94+0pEzBVM0NDQIdhpBpTUcuG4EFHCpkC+131YdxDOsX1LOR5uv8JjlUFlWAyCjjRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw9AsmIRx78XlxjcbPXzWr0lz7NpSvw+chXK32Ooa3o=;
 b=tgqIf3YjsJ0PjDiPB9+tyLm31yZlNgE39sXBfeOSby8gMM4SmkQylVabv2nSuABTG5gb11tLL1SQO4H5Ulz2RvgO1G79WZwRS0WcNQU8+OqBG08eA/UDmZCIS5PkHRRTZColqSSVtmcW3i1Om1+tgGoA56ypkmgG8czEal2n9Yxza5xnRc51wSBscKCggXz5eDF0sCLt3xctm7KQCvy5JCJb1o9d8SwmANfuLWp9WpUvSKh83i9ZyKYizzpHLsZR8RIEaVy0ZGmy352yhwmINbW/sNTdfcUxM7M7V0WAshcqmpkKDQE2UJ30DJawqteDhA5Q0IUXkBdncBqlB9Faww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw9AsmIRx78XlxjcbPXzWr0lz7NpSvw+chXK32Ooa3o=;
 b=eor2i1X6umPmmjDf66zlD1h0R2IiLEnOIHIhhe9y5vGmPVStppteo70JtEITQiy69Dz/KuUPQl+oMv0sjKHO0Vx1okv60MSynzOMyWOuNB0vlUyxPaVHi+A1ZJEqbhg5/tVIlHXCCRWzp0AjoMiQ9BhG0oHy+lv9z52rjRe8C4E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7338.namprd10.prod.outlook.com (2603:10b6:930:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.8; Fri, 13 Sep
 2024 17:21:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.003; Fri, 13 Sep 2024
 17:21:05 +0000
Message-ID: <c0e77ec2-5ab2-3fc4-9ed7-421a21db1be8@oracle.com>
Date: Fri, 13 Sep 2024 13:21:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/22] Set the ERROR PRID in BPF code
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-5-eugene.loh@oracle.com> <ZtucZiRk7G7UVktd@oracle.com>
 <d009801f-28e4-3b69-3f2f-ae99b577c1bd@oracle.com>
 <Ztu0ehrOeHqwIvmG@oracle.com> <ZuNQA0MEWvk/mAyt@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuNQA0MEWvk/mAyt@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0414.namprd03.prod.outlook.com
 (2603:10b6:408:111::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: f8674403-25d4-47d3-b132-08dcd41872b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE1QUjNwSW5LdWdhY1BtSkZGaVI0RStqOC9zOVZtakRPNTlpRmtQQmdFMnI3?=
 =?utf-8?B?TG51RTVoZS9KNEg0ZDZaRFJKUllZT3UvRi9JNmhqVXp2bEUzZHpqTHlMZGtK?=
 =?utf-8?B?WUZQWVdwSWJKV1lFS3Z2SlA2UlR4VE5QSXhSZ0FXZUdsS0FHRzFqRzFOT3Ix?=
 =?utf-8?B?a0hKQU5LUWxjcFNhMm1NUkNuM2FmcGFQNTZLZ0Zjd1dzSy9YL1d1b3BzWk5V?=
 =?utf-8?B?ODhrWWQ0N2VzQTBxWk5LYWNPZ3RiVEJiaEp3N0g2d2hjcWYrdUd5YUdEeXMv?=
 =?utf-8?B?eW9JL1o2SVdtVGNyb291TlBCKzlWZGU1UVdTZExFTXhpNENIQnp4ZDY2OWtl?=
 =?utf-8?B?dkVMZ0RTc2hZU3lhb3FxcEMxdk5VVzVERTVEMkRsZ0RGUllva0Rza1l1MGtQ?=
 =?utf-8?B?SkZIR01XUnB2NFFsQ1hMSGo5aHpiR2xRdVFqb0NRYzN0WUtxaWtjWDZsYlVm?=
 =?utf-8?B?cWcvdnZmZkZiT1NjTThUNXY3Y21GVWFITW1OOEhJUTRXM2ZYQkRsWHJlTUJ5?=
 =?utf-8?B?NjNQOEhhcThGSTlLQ2c1QitzdW5tUUxpYll1OENkeEp6MDBUTkp1RkQwa3RW?=
 =?utf-8?B?OWYydDVMczdTZ0lVZjFzNjFNNTRwS3ZudVduamVvRjJJTWlLZkQwcFBTb1c2?=
 =?utf-8?B?dGg0Q09tRWFpdEVTYWJzVmFOeHg2TnFtSHdNMDZuWWd1eW5pVzRsZzhHUGtH?=
 =?utf-8?B?RUpRamx6Ym10SXdLMlNRR0w1WTk5VUxFa3dHYy9Cci9QU21GVldqbnEyaHVz?=
 =?utf-8?B?bkFvaDBObjNlM2xiUCtVQXVLdG44UkpYNHN6STVFSm1SY1owb3F6NzA5SGx1?=
 =?utf-8?B?K2ZMVFRORkxxd2cxcmZXeHJOVXFKc0poNFlvci9DVEozOHpZbkR6K2RPbEF0?=
 =?utf-8?B?QkZsU2JEcG1DeVZoT3BiTk4vYmVsaGdtR2xlbVpCdCtoc1UvN2xnSWJYZVdj?=
 =?utf-8?B?Slczd1JqdGJjQTFzdXhFSDlWQS9EM3Y2Ull0M0ltclFKNC9mOWxENmQvU1h4?=
 =?utf-8?B?SVZLRTc1L0ZvRUhDVDhROTJTcHZyVDZQNmtvN1hrQXhINzhMTGRTZC83Rk5x?=
 =?utf-8?B?a1JZNW93VUFsZE1xSUpIM2RQRmQvREpUcmJ3byt4NkVwZlhwL2dUb243ZURs?=
 =?utf-8?B?SVJqek1XL3JQd2tMdFQ3NHRYY0hSd1YzSlpEcUp5OWpIMkpnNlJnME1GWTlD?=
 =?utf-8?B?Tmk1Q0lSRTY5OFdiSnh5YUxiQUZGL2FSR1k3ZWJyeElyVXIvWUVoeFFBUFBN?=
 =?utf-8?B?MnRzNXFzNVdNQjMyWHovSE82RjYwUU1kdXd5QlREYldOTEJBMEFsam5wNGFV?=
 =?utf-8?B?QkovTkdmSWFVY1RWbHdXM3pBMWlyejFmL2lHTXRZNEFiMEtFS1g5OGI1Z296?=
 =?utf-8?B?d0ovWUttL2pPS1J1dk5QNEh4TTY2Nks4bDZCelVqdjVpcis5c1BIdVpWdDZ3?=
 =?utf-8?B?aXl2TFUrTThGQTIzNUk2YTVtOE5JOXpjK1luYmZrNmM5KytseXBGVkJKY0RO?=
 =?utf-8?B?a2ZuRVpNVW9abWtLY1NFV3BHMlV6WWRIZWtBbk9KM1FSYmxFbTRnVlo5WFF0?=
 =?utf-8?B?MDNXV3BJOTBIb3E2bnhQK2g4NVdRUW9Sb3Y4elkwMmFFeVowMjlZSDc0UFRj?=
 =?utf-8?B?d3VaMEk5YVdXWWlBSnpEazkvUFE5NGhpTVlHMG5uenBzL1hDSWRyZTZtdzVF?=
 =?utf-8?B?Mmk5MHd5cXQzeVdoS3hqOTByczVRK1NPVGJJNXF0d2Q3SGtyZWc3ZWx3NTY5?=
 =?utf-8?B?YUdPa3JJYitQeFJBWDBOb09YNm5NdE5PMFJKMHF4L29aeERiNUx1Z0wwZTJn?=
 =?utf-8?Q?I6SCHdKDhHluIPLH0B2FT/ICx3u59NejoixxE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjkxZ1U4UGppbXRMaEhYNnUyUzYzR0RiZGUyZFlPLzNFR2luUWNPMzh2bTMx?=
 =?utf-8?B?OUkwUE1hdGtvcSsxUUo3SnNWNEFqNm95M09uZ21DbERuU2g2RjNaRzJvUXQz?=
 =?utf-8?B?aDVLUlFjdjV0N3BoQ1lsM0QwNFNTaXhPMjBQSml5d3ROKzYyUzRISDJ1VXZ1?=
 =?utf-8?B?bzZ1eXR6RXVvOE9ZOGd2QUhNTjAxQ0RDL2FBQVNlYVlSK09MM1FGTnVSVVYr?=
 =?utf-8?B?ODFNRzQyaUtINEkyNEsrOU91SmVZWmV6TTkzVlUyVTV5Ky9lRkREYThCNWk1?=
 =?utf-8?B?QUxzQTEyblNLajhNeTQ1WFRYOEdzV09nQTd6Zm5yUUhaNEhnZ01scWY5NjZ4?=
 =?utf-8?B?RnRiL3FyQWIxTEhTZFY3MkNieGJYUm5FdUtnTElGVlYzdkdmOEhiVzZHbzZu?=
 =?utf-8?B?SVE4NVREV1VjOVMrRlhlOVIyMEZUWUE5amVhYmNCY2lNbUlPanl5aWxMOXF5?=
 =?utf-8?B?dDJUNDgrNFV2RzZuZUVjVmR6c25wYm84YkdDSnFVL2FLbnN5R2JkVGNjVkJh?=
 =?utf-8?B?ZlAyYTlCeDVKNnhaZFF0L0V6cnlzN2tTZ0Zuc0RLSFNPUGlqaUxQTnN1YllC?=
 =?utf-8?B?TFhpNTY2eGRCU3BFdFhicUxOQXY5UXNCTHZtWVBZbnJQaDhwTzB2SjZSMk9Z?=
 =?utf-8?B?ZS9NMEsxeHNwNGZMaHQ4Z1Y2OFBBcVFxazVxUEZXbk1YVmd6cG9zYWQzZ25P?=
 =?utf-8?B?S1RGdG5vbi9EUCsvZDhhTjFHT2JFTHNId1dhcDFWR0ZqMGd1ZFl5Q1RzNzVu?=
 =?utf-8?B?RGhTZkhsSFRLb3dwZG9xZGxVN2trTk1uSmNLd2FtTVlWTHI0YUxvYjNJVDdk?=
 =?utf-8?B?R01vaW9za1ZlQi9idG9jek81Rmkyc3pTTjh1QnpQTVhSeHNLelVWdW1mWTEx?=
 =?utf-8?B?YkhZbnFqOEJXZkdXOXJJNkw0MFExQW9HVTVhbVZjZmZpUmxjUjRLZWFGMVZ1?=
 =?utf-8?B?c1BSSE00SWFQRlp1YjQ1c01PNVlBNlFTdGFoVmZXektDamFSRHZJZU1pTWtE?=
 =?utf-8?B?d016aGU3YTdmKzIwd2o5UnlNVVhJTkxrdmxWMnI4cm0rYlZTdFk2dkMwWGF6?=
 =?utf-8?B?L0VWbzFwaVJHcjBrYjJiNW52UklnMTVsWHF3dlJhOWRrOUZJME91bllRSDBl?=
 =?utf-8?B?Rk4rT1ZMMmdKYkdncUlDeVJpWGZ2MjJnS3o2ZFZYU3dva1lHaTdzTDArY2tQ?=
 =?utf-8?B?cURDNmN5S0lrNDBEd2RIYlN6cGFFVjU0bE1xTGFLSVNsQWhuNWpabnhnUzhI?=
 =?utf-8?B?S0h1dFViUmk2aTlLWWR0a3NTUG5KQ2ZTcjJFbElaYTRURUZ0VTRjTnJrSFV4?=
 =?utf-8?B?aHlGc1JCeHErenlGaXFDa0Z6aCtQYzBQZHdlTFJENmRMcWpRM0lhT2RUWkZy?=
 =?utf-8?B?UUNaUG5RRFQxVitzZkJVRVRRd3UwWlJHazJmNzNWSVdOeEJKOHFNYjMxZ21n?=
 =?utf-8?B?Z1VWRCtRVGJHeDFYZXlWZEdIQ2szdFhHTXUzZDZzWFZmbTdWVFBCOCt4RTQr?=
 =?utf-8?B?NGNsQ2FyWlk2b293WUs5TmlPQU92b0RSdE00RElPeFExWi90ejhneVZCdHFi?=
 =?utf-8?B?NnNKd2IxME9aUWF1Z25iSHB2RVRReDRtZm9IL2paVURudTJ2S21QbGdCeWow?=
 =?utf-8?B?K0NPNTU4WWRXL0k1WDVQMGFCVjJxUmU5TmIzTWxmaHdzWHltSGNKL1lhbjQ5?=
 =?utf-8?B?eVpKSTFKSWNtMUlXbEE5Uys4elRpc2tlWjN6eGVabzc3WCtqUHltOVozOFRl?=
 =?utf-8?B?UlpJQ0pUSjJuR0NLdy9HOWlsWk5oR2IrNjlROHp3cms2QTNpVmRtRkZBTWpz?=
 =?utf-8?B?anoyTzlCN2NXMVlRR2hYcHRRejBUYTVPekdWUkhseVQwbzFETWhrYVI0czBk?=
 =?utf-8?B?V0ZRb0E2WXFSZmRLdzhtcklsbEpnMzlBazNVby9UaENqS0VaZlhuK2pDaysz?=
 =?utf-8?B?TEhzdkJ3OERWZU5hWUs4aHkzZWVXSEJwVFFGbkRjQm9nYVAyVE93VExjVGlY?=
 =?utf-8?B?TGZ4aWY0WklWMVNzSUdXdUVtY0hkUUIyNDE5dUZVNTdvWUpzdkh0aENHek1p?=
 =?utf-8?B?ODdOdjFRRlEzaGZZaCtCY1EyR2ZoUHBOcUJSWVJXZkREcVdJS054SnpPZFdl?=
 =?utf-8?Q?NDzKWi/QZntEYpMDBOMaipKJk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xON3p80vR3U+blqp/BEjo4PwvBxct4K8+z/inQRqya5N4iK7s6xPKLNf03ERKtlro/I0EKbGrsbu2nrkK7chssDWuupIVlZlhoVrTlLZD3DqDsUJzLrQQt8bMrAWMChRV+W3oKoyTbrrIVTWLefNOnNtsCB1+uhPiKdsW+8JohPiBmmcatw5YPKSfpL1Pn1kF1EKNxzRnyL6YUeHNC+T1jVDa4DXWapz+Zcns8M+vH2lEntro3C1x5DciFWvBDZMLsqZ/YMBAyX9LxI40h165SlXEVf4fP96ssmOflqVtyy3KTVsqMFwz80WFmyge8kaEDd+trgI/d0bHevsclqELZzMZ/BS2lDaHXiaRJ0+xK8Q0rrAS3uf1VNTtLagSpgg2ccDSLMZcVB+EoABgP+lVQgK80ITtq/jRxgmsobKZmkqSQfZqAtC9KMl1C0BZH3bIIMnc+FHhuGTFKkQ+4aVPeac8XK1E0i+EAwtbqYIM+I3NcRgOLLSvhe+9+lB4/lY43S5RPV/VBrV55eLTf/XenKnHsVy+4eY6i0UxDB8jl9RlxtomxxceY1TB3oetUJtjAlWVpGPpUhSZgmYr5saqi0UAw9q3b7vvaojwXZ9+44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8674403-25d4-47d3-b132-08dcd41872b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 17:21:05.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zywNgpfjzIrgzhtcRWA8brGJN09oVeRwLEyLIKb6tOpInsmJx0LHCxm98bnDWiI4EfD1qI6TcDZBN2kjV5AJFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7338
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409130123
X-Proofpoint-GUID: P3IcCP1OPYjxE_6CYIGyRvnyKSKk5gvX
X-Proofpoint-ORIG-GUID: P3IcCP1OPYjxE_6CYIGyRvnyKSKk5gvX

Okay.  I posted a v2.  I also posted a v5 of "Deprecate EPID" since it 
experiences a minor side effect.

On 9/12/24 16:33, Kris Van Hees wrote:
> In addition, I think that the test should compare the id reported by the
> ERROR probe against the id given in dtrace -ln dtrace:::ERROR output.  Yes,
> it will be 3 (and I think putting the following three defines in dt_dctx.h
> would be helpful with that), but by doing the comparison against the dtrace -l
> output avoids having to encode a constant value in the expected output (and
> we cannot easily access the defines from the test).
>
> /* Static probe IDs for the dtrace provider. */
> #define DTRACE_BEGIN_ID		1
> #define DTRACE_END_ID		2
> #define DTRACE_ERROR_ID		3
>
> On Fri, Sep 06, 2024 at 10:03:38PM -0400, Kris Van Hees wrote:
>> On Fri, Sep 06, 2024 at 09:25:12PM -0400, Eugene Loh wrote:
>>> On 9/6/24 20:20, Kris Van Hees wrote:
>>>
>>>> On Thu, Aug 29, 2024 at 01:22:02AM -0400, eugene.loh@oracle.com wrote:
>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>
>>>>> We use the fact that the ERROR PRID is always 3.
>>>> Where do we use it?  We certainly should never override the probe id that is
>>>> assigned by dtrace when providers provide probes.  Will it always be 3?  Almost
>>>> certainly, yes.  But the right way to do this is to actually make the ERROR
>>>> PRID available as a symbol that can be resolved at program load time, so that
>>>> the dt_probe_error function can get to its value.
>>> I'm confused?  I thought I did this and you suggested simply hardwiring the
>>> value 3. https://oss.oracle.com/pipermail/dtrace-devel/2024-July/004989.html
>> True, though I didn't mean to just hardwire the value 3.  At a minimum, I think
>> it ought to be a define to set the value of the BEGIN, END, and ERROR probe,
>> so that a symbolic name can be used in code.  And that probably would mean that
>> it is best to add a check in the dtrace provider to ensure that those are
>> indeed the probe ids assigned to BEGIN/END/ERROR (and if not, something is very
>> wrong).
>>
>>>> Anyway, the need to restore the mst->prid value in this patch also highlights
>>>> that there is a much bigger problem...  A fault in one clause contaminates the
>>>> first 6 arguments of the probe, and since a fault only interrupts the execution
>>>> of the current clause, following clauses will no longer see the correct values
>>>> of the first 6 arguments but rather the ones that dt_probe_error() stored in
>>>> mst->argv[0 .. 5].  That is a bug for sure!
>>> Good point, but... a separate issue/patch?
>> Yes, already written :)
>>
>>>> Here is a test that demonstrates this issue:
>>>>
>>>> #pragma D option quiet
>>>>
>>>> syscall::write*:entry
>>>> {
>>>> 	self->arg0 = arg0;
>>>> 	self->arg1 = arg1;
>>>> 	self->arg2 = arg2;
>>>> 	self->arg3 = arg3;
>>>> 	self->arg4 = arg4;
>>>> 	self->arg5 = arg5;
>>>>
>>>> 	printf("%d / %d / %d / %d / %d / %d\n",
>>>> 	       arg0, arg1, arg2, arg3, arg4, arg5);
>>>> }
>>>>
>>>> syscall::write*:entry
>>>> {
>>>> 	trace(*(int *)0);
>>>> }
>>>>
>>>> syscall::write*:entry,
>>>> ERROR {
>>>> 	printf("%d / %d / %d / %d / %d / %d\n",
>>>> 	       arg0, arg1, arg2, arg3, arg4, arg5);
>>>> }
>>>>
>>>> syscall::write*:entry
>>>> {
>>>> 	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
>>>> 	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
>>>> 		? 1 : 0);
>>>> }
>>>>
>>>> So, we need the ERROR prid value exposed as an external symbol so that it can
>>>> be used in dt_probe_error(), and a patch that fixes the contamination of the
>>>> arg values.
>>>>
>>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>>> ---
>>>>>    bpf/probe_error.c                         |  3 +++
>>>>>    test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
>>>>>    test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
>>>>>    test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
>>>>>    4 files changed, 42 insertions(+)
>>>>>    create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
>>>>>    create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
>>>>>    create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p
>>>>>
>>>>> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
>>>>> index c8ddcdfa..ee1a1793 100644
>>>>> --- a/bpf/probe_error.c
>>>>> +++ b/bpf/probe_error.c
>>>>> @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>>>>>    			     uint64_t illval)
>>>>>    {
>>>>>    	dt_mstate_t	*mst = dctx->mst;
>>>>> +	int		oldprid = mst->prid;
>>>>>    	mst->argv[0] = 0;
>>>>>    	mst->argv[1] = mst->epid;
>>>>> @@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>>>>>    	mst->argv[4] = fault;
>>>>>    	mst->argv[5] = illval;
>>>>> +	mst->prid = 3;
>>>>>    	dt_error(dctx);
>>>>> +	mst->prid = oldprid;
>>>>>    	mst->fault = fault;
>>>>>    }
>>>>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
>>>>> new file mode 100644
>>>>> index 00000000..59021c60
>>>>> --- /dev/null
>>>>> +++ b/test/unittest/builtinvar/tst.id_ERROR.d
>>>>> @@ -0,0 +1,32 @@
>>>>> +/*
>>>>> + * Oracle Linux DTrace.
>>>>> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>>>>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>> + * http://oss.oracle.com/licenses/upl.
>>>>> + */
>>>>> +
>>>>> +/*
>>>>> + * ASSERTION:
>>>>> + * The id in the ERROR probe is 3.
>>>>> + *
>>>>> + * SECTION: Variables/Built-in Variables
>>>>> + */
>>>>> +
>>>>> +#pragma D option quiet
>>>>> +
>>>>> +tick-1s
>>>>> +{
>>>>> +	/* trigger the ERROR probe */
>>>>> +	trace(*((int*)0));
>>>>> +}
>>>>> +
>>>>> +tick-2s
>>>>> +{
>>>>> +	exit(1);
>>>>> +}
>>>>> +
>>>>> +ERROR
>>>>> +{
>>>>> +	printf("id of the ERROR probe = %d\n", id);
>>>>> +	exit(0);
>>>>> +}
>>>>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
>>>>> new file mode 100644
>>>>> index 00000000..95974abe
>>>>> --- /dev/null
>>>>> +++ b/test/unittest/builtinvar/tst.id_ERROR.r
>>>>> @@ -0,0 +1,3 @@
>>>>> +id of the ERROR probe = 3
>>>>> +
>>>>> +-- @@stderr --
>>>>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
>>>>> new file mode 100755
>>>>> index 00000000..884b43f4
>>>>> --- /dev/null
>>>>> +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
>>>>> @@ -0,0 +1,4 @@
>>>>> +#!/usr/bin/gawk -f
>>>>> +
>>>>> +# Drop the line with run-dependent PRID for profile probe.
>>>>> +!/error on enabled probe ID/ { print }
>>>>> -- 
>>>>> 2.43.5
>>>>>
