Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B04CB36
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731619553; cv=fail; b=rqVJAddoA+2oeei7+nssG6FQcFxNa4K/wAd9wYqNVDJivi32HWvr8AQIiKeEl32Ulnjhm1MKDwemTxir/s1X82LzLRoDD9CQmaSF8kb3oIwhHeP4JwBfK4eMjQl8AqhTeUGij3fD8iEtx6m8GBD6pfdg2s2JL54iLLuTsxAvN2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731619553; c=relaxed/simple;
	bh=3YHrg7x4l9Dw/fdrwibwUwOwt4LN34MFtU0uR7wnJjg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pen4qWMQCnsggc06YoTKvH4R51qhX3LfhYMlOsLJk48/6tcTBOtnTCyuF4U+evB+e4l39DJDEsFGnRy9NhO3/mOIZVxtftBEsiAMLobx++e7Lv3Musbt92iQWhUOs0n1UO9PwG30bd0iwKdD/+BwPoLxlf9Nzn/RQpJcofcLkIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OM2pgd/O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p9BxuQyl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OM2pgd/O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p9BxuQyl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEKfddB012765
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 21:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6LqNeZO4/tptMjF1c85CP5LF3GDORiuug672k8iufwU=; b=
	OM2pgd/OeT1Iyn5o0CR55fMNeU3oxIdjDWzxckDJlgWZrz7k2tmPUN3nN+JiDs7x
	zInqayWy/KeVYtp2NSl80WhhVGE4Aj6f+H2WBbIfsyA3jYl19Qp/Mctuw3wOh/Sq
	ujWG2dKMOdhSTdvyx3qdmbTkiZ4WjVcrv1TAdasilM4px7vdOJln92OtJ7nLcrhj
	NBU76ltPbSWCRR2ZJ4ExK5dthig/4i9itbT3UydK1MPIvP9fjFjWW7bhXw8Ey0Cq
	Tr4MeIc5Gg40TlJgrmxi9TlidEwqfIDIEmhTrkGA40UrPPEO/Ro2sBQV/qe/pLm6
	gftXIGbDHOH7kpYs5jShag==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc2ayx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 21:25:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEJq90D036079
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 21:25:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bcyxv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 21:25:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wthNNTq2nrdSHhuVmgdiyooN2w/13s9eNMuWt1PcN1mO6nFVDcy7azNuhQ/xq8+9QFGJAOcXK7tKtmh6vlBYaPftk03Ix2GJiaaT+wt8OWHzu2Q55tXjObSsuwr+MXTx7b3Z6S2Lpnls82QaNIcQKbHqqhVwM3sUS7qyRs1d0sqJPsaX3tvZAm4I+OQF8sTyD3MyJUSKP4CVIedwy7+8PA2MMnnArHrEgepnzOcP7fanTNIUhFkBoHzOJtNjdE5qpwpzQ5s24rRNDCeKo0AVjXOG/6ZTMFUdXn7Uao/6qW+h9y+TvePPuoE6LXT2Ig+HgpSmnVnD1DFaOJfknRPW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LqNeZO4/tptMjF1c85CP5LF3GDORiuug672k8iufwU=;
 b=vPSMNWh50ukNAWylIvy9KjlzMfO9vqlmmOiCyYbYJPdpPddMly4KlGZeKQC1jONdb+Kvorb8zmnZbuQdVWcYrLsIsHQLRnL1OUlsgpSW+L3Fz7DdOVK3kU3pA4LJLFUeKjmNYzTfz9mV0nmd7xO+iuMmLYvdWTxIPQYwBA6cCB8G9o/by+Xs/Mv/8ma7vS1Ge+vyM+j0Q11rk2VDvkm7CFW/s63U1i5gi56643u0AW/XITHOS35tQAxj8+/ikdFlrXYDCBx+aUjPRZ/Z97tMW0DX0hO9Th7yynih9Aed528/4IQiKbAbjMPf46QJU+W5H1Z6QJoOVXwuvoX8lbhN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LqNeZO4/tptMjF1c85CP5LF3GDORiuug672k8iufwU=;
 b=p9BxuQylbrKlpnmGVRB6T/k32fTutmNhdV7WI5SIHo9N9CKfQCCAnC2BHPmc67DgVpj9EUnoqa6K0o+tnoy6flD1F1f89iQjtTVjkpWrvOY0r3yZ2+DzYhFV+SVXeNaJYsecrdvkghUSG0NyNr/BUjE7zitHqpkpQUjCsMGNwOk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8042.namprd10.prod.outlook.com (2603:10b6:208:50c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 21:25:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 21:25:45 +0000
Message-ID: <8ec502f1-47cf-812c-8b8a-3258b1a7caee@oracle.com>
Date: Thu, 14 Nov 2024 16:25:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dtprobed: handle multiple providers in a single piece of
 DOF
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241114160352.47939-1-nick.alcock@oracle.com>
 <07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com>
 <87frntwnxy.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87frntwnxy.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 152394ee-2d71-49c1-0ef9-08dd04f2e691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c24vSHAydFlNd25KbjRhUTMzWEVlTElYRzZFRzJJWnZMWHM0aU5KV0dGeTha?=
 =?utf-8?B?Rno1NGUzUkdteFZNOXNKaGdxS2pmTFFXUnZEK0VMWThrcGg2aWdQNndlUnBU?=
 =?utf-8?B?UCtmNFY5NndXVTBsNjBKdFV2ZnYzWU5xUlBybWF2c2Zac1BCTTlzUk1JaUs2?=
 =?utf-8?B?ZS9Xb2FVRUppNjlnTWtRMmpoOFNEajNyTTlQVlZqc3ExNWIyMXNoOFlYUmhB?=
 =?utf-8?B?ZmNvT1pWbWloMEovU1dubHIrRVJWYVl1cFNyMjdVM0NCcDlmZ0ZWY0x2NGJ1?=
 =?utf-8?B?eVdnSitmeTNhZjV2Wkd2d0xWMVpoODdhMUlHU3VKTURha1M4RlllNkNtQ2tS?=
 =?utf-8?B?Zzd2L3FnUmRxNm1JQktyQjRGcTZHQTBvbWd4SUJXNUE2UlRidktPNGM4UldG?=
 =?utf-8?B?ZW5abDhOYWovV2sxZFRZQlRjVjFGSzF5azd0alM0NWE1R2JmV3VlWnBTUytG?=
 =?utf-8?B?YzhNck1qanJQbDZLUHVtQ1BFYjFOcFNYM3ROTzVDMm5SR0diV2FrKzBIaDdG?=
 =?utf-8?B?ckNxcFlYR1kyOGtuSG9jOGVtM0ZzZ2ZiQ1o0bzB1Ny91ZS8rRnlsbGE1S0JR?=
 =?utf-8?B?WkFraWFuSnk1TTY0U0JMOXBoem9OYi9VWGMrMnMzMWdROTFSYkV4YjVkUVBY?=
 =?utf-8?B?RWI5TXdEQzg4MlVqMWc4R3lKTll1RFhGSlNVMC91WU9vM3JWU1V0aVU4eDFl?=
 =?utf-8?B?NUVYdWpFaTJENHJQRWhyOGJ3c3lGNm1UQnl1RnJERU5mZDJRTEV3amRXWkkz?=
 =?utf-8?B?Uk54NFJHbENBaUdwZGNyMk15Tkp6bGQrV3lzQUQzVURQdGRWSkpFeG1zRzB4?=
 =?utf-8?B?ditMNTlQdTlhdzg2bjlQYTVmci9BK3lTS2xrL3JOMVlYRzhaNDYwMlR5c2hj?=
 =?utf-8?B?Z1JjOGNBMlB4SzNWTVd4bkNOSHBMeW0xckRpREU5MnhpeFBQRmRZQU5tTHZq?=
 =?utf-8?B?MWhPelVjWlpvMmN2RFVPNUxSOUNLNkl6RVNuUVlpRkJoaXFzbEhlMXpiVjJJ?=
 =?utf-8?B?MUJFeEs2OThKenFVQmF1UE05QWNneXJLYjJab2w0V25QVEJBQlBrQ3Z5c2Z2?=
 =?utf-8?B?cW0zYlFOaExVNlRxQ256WEZGNGtpWGVZSm9vQ0FqbnkrYVRLWnJ5bmgxTHk3?=
 =?utf-8?B?bldveUVxZG94SlhxU0o4bXc2Qi9ibWpwNEI5dEhsd0Fkc2puelIzSFowVkpj?=
 =?utf-8?B?ZlQwemlGWVB2elU1Vm02c1loKzZOUkFPdWFTWDJnN1RzdSt3dlExa1lKdVBT?=
 =?utf-8?B?S2hZNWU2QTJJSW9aUkxuQVlQMUtZTlcvZmtDV1FFYTFjek5MZXk5UW8yMVEx?=
 =?utf-8?B?aDlBalJOQnBURVZySFlLSlBtZzd6aVE1M2NYeHJvbHdUbkxQM3Yxd21WUWRp?=
 =?utf-8?B?TThsTEtwQ0xsTi9WaXI0VVlCc1RxbzVsbzc2d3haa0h0bERReUJVbEtXN1Rj?=
 =?utf-8?B?aytjU0kzS2xPRnVyM1E2OUliYlorUHBwbjFwU1E4KzFQTVdVdVE0MnF3RVg0?=
 =?utf-8?B?MURZNVk2NEljcmFDeld5cHFYMmJVY3pyMWRuUVJOd1NVZnppMFl2L3RieFpp?=
 =?utf-8?B?ZS9uR3VTWkFBNG5ucW5jb0FBS0Q3UW55S3R0bFUrSnZoTkQ0RDd4YjVjQmti?=
 =?utf-8?B?RmlYZ0dHSU13R1VySTJLWnFKU1RRSVhwaEJqa3Y5ZW5FM0I1bktoZllnTDhp?=
 =?utf-8?B?dzhVQUlwL1dRVFVCN2VpYW02T09iVFpnQUNabEJ0MTFQRWZ1ZkhxbVZPU0FC?=
 =?utf-8?Q?DfbDff2lP110Q+aWKrXJ2oOuFbGF/fWHDRNWRm6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERRWHlSN2l6bkd1dDdCa3gzTkNrOE5qMitEM0szc21Bb00vUFdpZ3BQY3JR?=
 =?utf-8?B?Wk5QQnR2T1lvRExDOHhWczZMV1hnN2ZyOG9kVkFnbjhKR1o0N2NWOEpBMHk1?=
 =?utf-8?B?aWRDVG5pSWkremNDQmpWMU5xUEJmUjdXMmNrK01JWWFSb1h0SkJxVlpXK2Y2?=
 =?utf-8?B?cEsxM1gzaTJyNTlWN1pTNlNnUTdkUUhHMEx3clFHbnVjZHhEdkF1NlVqanI3?=
 =?utf-8?B?Vko2WllVaEFaeTNRUUF3UlhLek5xc1JOYUlZbFVQbGdSUHdEYkx5VlFtZnFq?=
 =?utf-8?B?UWJ6OFN1Ym56RkNnb29PLzVxaUdRMnRWenZEaTBqdnFnbEVCWHEvcFdKcS95?=
 =?utf-8?B?Y0tCVWlOMkliRGEwRVU5aXVpaDRoS1lodGhxUGVLeGg4UUQ0ekYwK3lIUWdU?=
 =?utf-8?B?SkVnWFBJd3hYOXUwM3VxR3BldFozVzFpWnNYZTE3Y255NjZJc05mSzROYnBL?=
 =?utf-8?B?ZFNpM2R2Z1hPYndTREltMDl5dDhjNzBBQ2VFaGZOaHRCZUZ2enZlUmthdlIy?=
 =?utf-8?B?OEFIRGZHM1VDSGg3ZjVKMmFSd3IybnNIV1o3K2FZNzhMUzBmRStwbytkUzZm?=
 =?utf-8?B?OHlhVkE5cVRxQUFyeVZFb1hpbi9WdmUrNVYxVnhlRHJtRFI2ZnQ5REh4eXcv?=
 =?utf-8?B?bkovRmZhUFFJQVlaalUwb1JTeXFRQU1rRTMvUXBzN1QxVGgrNE9LajVYeXN2?=
 =?utf-8?B?M1RhQ1BkTkx2QmM3bVhjcjdWdkZuVWF5QURrdTZ4V2ZMTy9BSGtCam1RN2xN?=
 =?utf-8?B?RzZXaVgzY2VqTXdMVVBZclNZZEdXYzNGelpBUkhoMmlIRW90UHczU0NlVjRi?=
 =?utf-8?B?V2JDcGpEZzZWUE4zYXB5STBvVVZQbGx2MGhKT2t1TW5xTkN1dFJPR3J1bi8y?=
 =?utf-8?B?ZmMyZlVKNmRDSEdCQ3BuOGZhRk9TM0pjdG92dTVVblUvV21LZUwwM2VyWGgx?=
 =?utf-8?B?U1VpSENNUzFzK3FaU01sNmgweGs3NHJrYUl5V3VlVm93NUFWKy9tVzVCeVVu?=
 =?utf-8?B?ZUVLNUJyWThHNXp5c2hoYUxvY0VhMkp3ekpwcUxNRlZ2NlNQQjRpWmczdmJR?=
 =?utf-8?B?UnpVSjVJWUhlbCtMM3UyelpnbmdzS2doV1g0WmtiaXhEdDBvbXJnalFNemNu?=
 =?utf-8?B?WTV0emtaUXB5UFFmY1lFeU1aeW9GU3phMTU4U1BKdFJ4dWM2bTF3ekpWcG1h?=
 =?utf-8?B?MUUzRkk1MmdCY3hmWGxpdlF0M3NWbk9EZkZlNXVRWEJ3YnRad2NsMVJIZzAz?=
 =?utf-8?B?WitVZU9SQjMzeVQ3emYzbGR4RUhMeWtIbUtaM3krdUxISDlmSFlpV0FLWE45?=
 =?utf-8?B?UzA4MC9LczlEbVNNbE1zSGZpcVRWYkYxSHZpUGp3cmdUTWpid00vYTBncUI0?=
 =?utf-8?B?d0xnQUJZVWF3UWpQdjI1NTc2bStwa1psVU1iaVFzTWhZUjM1ZjRDM0Y0TGRV?=
 =?utf-8?B?TzczbFliY1kwT040Zm9GbFRud2c1a0Z5RkJhVllobnJIL3dVMFpEVTk1UUF5?=
 =?utf-8?B?WTg2cVV6RVFObklFeVFjVjdYTC9EdkErRjVLR09FQnpvdWhHL2tKd1hxUGZk?=
 =?utf-8?B?V0VlWUxETGVxMm9mbGtrUFF3ankycU5HNm5FeEV6Y3NzdWFrVyt1bEdsRG5q?=
 =?utf-8?B?d2MyaGQvOG9HbDRWZVBINCtDOG1pVWk4M0I0ZkRKNVZ3NHdsbkFRS3hYTmln?=
 =?utf-8?B?YmJ3amozTDZ4ckdISDVPZkZLZkhXalF1THY1TUN5OHd1dzZUUnJhRHgvS0dz?=
 =?utf-8?B?enRqT25zeDFoWjd3TzE4VG5vUG52bGxrcVhwaXhRZVFYTU9qRWFieVVzMzNI?=
 =?utf-8?B?Tk0wNWxrVU9WUVNIN3VXMlYydnpsNlFkNmJycHhpdWtET3grTmRieUtUV2lR?=
 =?utf-8?B?Z2szbmxZWjdmdGNjTm9UeWYvb0puUjJPcG8xb1dTNlpzZWNkalB3M3o1SHVN?=
 =?utf-8?B?V0U3NkdnTkd5RWI5ZU1rZ1VBcFFWMGs4bWc3QkgrbW1jdVNpaEZudHhWWi9m?=
 =?utf-8?B?U2x4ZU5waHdhVXBoZ1pMcEg4UnpIL1d2NjVHMVVqUUJidEFyM0VYbEVRc3BY?=
 =?utf-8?B?ajByL1F5Uk5WYTd1QzBENjEyQjIwZHRJK05xOG5zMVlHTmI4QXg3T0czcTNE?=
 =?utf-8?Q?sO6Gy3ChV5a7OwiIfl9moBllb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K70iWK2Il2psXEIJdh0d2fni2en+xF0EroCECn8mQAvem+NunE4lNHmKY4Xcy5WhBk2k+4SYTE/DO7PT6S4hDOXBZ4G4wiWnPaQsgQWxHHbK4Lyc6MBqVDlc8VSbZOSMOmspQ3f+1yafSINo3WUZX4FpugoCTbFXQfE5tlMQGGmlCFijuYsX74Sr6rvGBeegpPwLfpd/0+dMXivt/cRH9E1JDQkzWi9+3AeNulzYvLsAbWnxZEN/y1TLK3NumzXsYRe6NvQ1iMI3DduvwM1ZhdpUxSlYVnrVZsnwDE2xJA1oyLEqMqhjNOUw0RYcbuDiUoSODR7lqQqVJ/PQz+qhqlC1JhY73UJRHtcgYfrlvql6WRDLSKl/im5M6KfWxcWmixK1oOu1noIpzJ0cFpJjR4ru82JwbXHqLlYATBukfHbXrjRn2MVFyg6Ck9ASX7WcORb3C2F42zti9u+dSeWGFmbqtZNYYAUKKJ8TBaf+lTMybC6FxAGIqwrKWtJsG2wV6mehNJFxXKJ5npNHN/Woz0GbFODosh8YPzwGq8xO6GPAEXVVV8dfgJLU/MfAwIqBOffbNe3UeRjaLMTwLY5eA3v5YDFauSJ5kpG8ZHFLovc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152394ee-2d71-49c1-0ef9-08dd04f2e691
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 21:25:45.5442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/4MvVMqjfwSPZUAVs3lpbpIICmsvg+XWqbdq3hs64azvhe5w8epBUMJ/ZM9D4z8uZiHe7omV1tbxRyrCB9lqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8042
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140168
X-Proofpoint-GUID: w7MNkm6oSfo0mKAollOOHIEXY6RC22Gg
X-Proofpoint-ORIG-GUID: w7MNkm6oSfo0mKAollOOHIEXY6RC22Gg

On 11/14/24 15:38, Nick Alcock wrote:

> On 14 Nov 2024, Eugene Loh told this:
>
>> On 11/14/24 11:03, Nick Alcock wrote:
>>> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
>>> new file mode 100755
>>> index 0000000000000..ae8493e3d5be4
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.multiprovider.r.p
>>> @@ -0,0 +1,2 @@
>>> +#!/bin/sh
>>> +grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
>> Okay, though the "grep -v" would be clearer to me if it checked  '^ *ID *PROVIDER *MODULE *FUNCTION *NAME$'.
> Why? We're not dependent on the format of the header, we just want to
> get rid of it.

It just seemed to me easier to figure out what was going on.  It looked 
like a recognizable header.

What do you think of ' *PROVIDER *'?  The 'ID' is short and strikes me 
as especially confusing if one looks at the post-processed output, which 
has 'ID' all over the place.

> Having the test fail because the header we don't care
> about changed layout seems wrong.
>
> I might just drop the first line with tail -n +1...
>
>> This whole thing would be clearer to me as a single awk, but maybe that's just me.
> How? Piles of gmatches?

gsub() or something.  Anyhow, your choice.

>> Comments might be nice.  I'm not sure how comfortably people read regex...  I need to concentrate hard to figure it out.
> Honestly this is just doing some "replace changing numbers" stuff like a
> hundred other .p's in the testsuite. Looking at the .r makes it obvious
> what it's up to.

No big deal either way (e.g., adding one-line comment).

>>> diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
>>> new file mode 100755
>>> index 0000000000000..d5b72c2be77ec
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.multiprovider.sh
>>> @@ -0,0 +1,15 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +#
>>> +if [ $# != 1 ]; then
>>> +	echo expected one argument: '<'dtrace-path'>'
>>> +	exit 2
>>> +fi
>>> +
>>> +dtrace=$1
>>> +
>>> +exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider
>> Okay, but there should also be a test that actually fires probes.
> ... why? What we care about is that DTrace can see the probes properly
> (since we already know from other tests that once it can do that,
> everything else works), and -l is an easy way to verify that (and in
> general exercise the entire pathway up to USDT probe discovery in dtrace
> itself) without having to get tangled up in even *more* possible bugs
> around probe firing. I hit enough bugs in the parser writing this as it
> was...
>
> I mean I can write one but I don't see what it's going to tell us.

I'm less concerned about the bugs we can foresee.  I'm more concerned 
about the bugs we don't foresee.

I'm even interested in the case where probes in different providers have 
the same name.

Different subject:  do we have a test for "dtrace -lv" on USDT typed args?
