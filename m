Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E73207
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236442; cv=fail; b=O515+nSNxMsSmECyOau7jSDiFi1PfR4soJwlsfHj4jIMLNqoRjCDjyuMMPDmsJUIh/XZe1vgHVl3CiH2I2ZTOuWWlecIVC62ceqB1GgUKZ0dGS7m9/d3VOKL765vcvyVSCw7nZAubScYGHdeEq2B5IC65fSL6n3wWc33MZ8VaJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236442; c=relaxed/simple;
	bh=dKMmlOv6RDxXVXe2vKBFm56KXZo1WRLJEZhlzqgX6cc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HrnifWZcSiduunvpy57Nfd+ENlUba9DpEbLSiI4Av0coDh4lrS4gvcfApsBtaRHOObRxgcDqu2bm9SlcqIzdX7CuXc4mlwDo3Io1R/TK2P5rUKuRDNGlcZn0RFiCethTSytqEZcHNqRX04kptIkRsHhquuWn6Pnf2iofBHwkmDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vy0lsjpQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=babf5LdP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vy0lsjpQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="babf5LdP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfUSG030889
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=yQGsOdD0t30mMDLrESW0rZTyeI3NFJxjHvbJQUrvJGg=; b=
	Vy0lsjpQcA7t28EVW1YV4WsNmTTmf6yYT3/LUlbRyeBkXIAWF5A23kJoEI2P04Ag
	rye4UlVdKA5tuC9xJigKGivtmp5mDbvoTOkETWyfOFdRhEsGed2+uNL2plRLlW8G
	AobZw9Rlb0mFFOGkwB44dZWU/NrX9BGcjBB+c6chYpny5zvgjGevzvx9llvbbIIm
	KQKArKe9J3zWulPaQ5ZL3fuq/jqO6A/53EiiJ5phT1l8qKV8FxUf6OaUXN0ig41B
	yfGQtDmbLaUvb8laYVQ+o18U/feLxn62Hpt9Yt0F/WGki4bAJtX/b1dmk0aK8Sir
	4E6UoKCH22IUxrcjiCCc3w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp6mdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:13:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKb1IC034715
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:13:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd88wyr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDp7+k8+/Ily893I3jpYJFKREnYAjz/9T8iw8kKdMdknVUL8FuVnTOJ3KsaclLDZ3ZNTkxEGrNch6g0LwbQsLNrQFyXXJg41hjvTUbNKm63fyXKJomyiMOrOv5gObtOrSPnn8wHutN4faWRTeINFB5fT+bVoYc5pwySD3hPMYqAOcMCLS0/nMLWOtz1A5bJJ7emUBHvg9BNzkYHlxp5KZq8jmAE/C1EDlCQW6KQKIR527kyaAOi9GNhRnFJRguq73eGy7d/7mE97Bd4XbRVBHtjoqcfdzBa0pD41qChv9IPoZagFbnOZT1iEMOsh2Ez2veE6ztksrK2e0Z6+c+XHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQGsOdD0t30mMDLrESW0rZTyeI3NFJxjHvbJQUrvJGg=;
 b=muaiaMWRjTnf0PPUaOuD4FBt1jGk8/2pH8Ws7Pm05uORZYUg4GTAIrcJeNU/KdEdQLOmSOfQtoga8r9yhjfjyvifn2MNQhffKaPHD+BpgAHre72ImwqQ9dJyBp9j85jV+EDQENUC/lT2+g5iHL6dctR/TYya5fgzUB/6rbce8oraq2HhBYMLC2k2pEZrDGjHlbmlLBt3cHOztbgPRgfU/GCmHx/5jbWB04ezGj0rIhMq5vJQXMRk37YhyPtdQqSOdcbBKJ3NeVrB5OdMA1L21t0D85L0uFspQU3BrmpoUZ96uwIH0svSnhVCnWRBEVPcyv+20Fa8+CEYoBBLsJXXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQGsOdD0t30mMDLrESW0rZTyeI3NFJxjHvbJQUrvJGg=;
 b=babf5LdP+IKkaeGORQzASWQsykLufYIhK5yUMIMyUbVYk/6HdnGcPStL3bZktjzs0xFj8z1ArBUPrlbW1GnsaInnweFWGaYSx1bhU9Qq6mjNOPvypMkdELUcJ1HkqpanwkvyxeufZa3gjdOoYekGeMcTmQHW8NMTeVPP4g95QR0=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by MW5PR10MB5763.namprd10.prod.outlook.com (2603:10b6:303:19c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 21:13:53 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 21:13:53 +0000
Message-ID: <70402341-3f23-8ac4-e512-c83e85795fc5@oracle.com>
Date: Tue, 29 Oct 2024 17:13:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 26/38] test: Annotate xfail (chill not implemented yet)
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-7-eugene.loh@oracle.com> <ZprWruD8mYUA7zW0@oracle.com>
 <01ed8c58-ee33-c568-0767-2e246564e1a2@oracle.com>
 <ZyD5yaBs0BOlqMZP@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZyD5yaBs0BOlqMZP@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|MW5PR10MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dae29f-d144-4dbe-d003-08dcf85e9777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlN0c3h5SUUwdU5oNE11V29XRVpKV2RkVVcwcWdaZU93K0ZIbUJNanorSTh5?=
 =?utf-8?B?dDJJMGlGTVlaMXMxbWlCUXVQMG1JT2Z4S1pYZDB5YnFXQ0hxRG1XdFBscW5j?=
 =?utf-8?B?L0dyeHBRM1cwRWxVVElsREJ0dTJ5allOQTJNbVRuN2FSWnpvc1Y1Tm1tdzFr?=
 =?utf-8?B?Y2JwcjZTOG8xVE5VYjd6UjFjOURUdVFhcmJ1WElLUEZpUDhLU2NrUUR4ektQ?=
 =?utf-8?B?anRpa1gzMEkvaDNyRlh4R3VzTmNOdlNocmQ1Q2tlYkEyWjdReXF6WDVycEYz?=
 =?utf-8?B?Q050RGJEcmRuaGlZWitESmwzVTV0dTgzZkEyWCtpOXlUam43NGJvanUvY25u?=
 =?utf-8?B?SFJoN2dOSXlreDhCSjRDS2ltajBkRkxoUUl1K01vb3Q4cEFJRVFRUTcvUkJL?=
 =?utf-8?B?V1NvbEVqQXhORk5KRkZXYWZmU3g5cVNDWUdOSXFpQVNpNjhpNllkS2R0a2xq?=
 =?utf-8?B?TWx1bTFpOGMvUU1JaEdoSmxQMU9BY1VlUFFIQ2U3K09lM0wwLzN1OStXZEsx?=
 =?utf-8?B?TVovek5USHZjRGdVQVMra2ViLzBGSndHVnJpaEQzc3VNYzRRVFFSaXduTDlk?=
 =?utf-8?B?V3FCK3pTeU04OE9PTFU2T0xRZ3cya0x4eWRlSTFWYjZqOTMyQjc4cjY2Vzg4?=
 =?utf-8?B?YjV6WTFSQkx3RUxQV0k0S0ljT1doTmpqSW9tTzVEYzFTOTJZVERpcm82Nm1w?=
 =?utf-8?B?VldxeDNsUU51UnY2V0JuLzk1eXluL011TDJlYWlsc01JeWNQcDdmbTlrOVln?=
 =?utf-8?B?WnZ3Z2I3K2NSRUt1V0FqY0t2YkZZc3NFTkFIbGhzZDJQUldOWWxsbFd6YXNG?=
 =?utf-8?B?K0dabitsMDRlQmlXbi9GMWwzR09uWVZhSVdublNicUJDYXJ4SUJJSldHNStX?=
 =?utf-8?B?bzdVSUJLcUhxOE01WVlLYW1QeFlycFR5ckFwck5yN0I3QThkQmtRUjlpQncw?=
 =?utf-8?B?VG8zT29FbVExclFtL0xsVzlpb2ZmSXR2STNhaFQ3L09ja1h4YjFsbnEzcCtk?=
 =?utf-8?B?TXN4bnJUZ3BLbmk0Nm5TbVRqbjI1aGxCRTdQR2N6N2VmN29HeEhvUzhUU2lI?=
 =?utf-8?B?U3pTWXltaTZYZ1FKaGhuY2NjcDdBVDRBNTk2RVZVdk4zT2x3VHNLc2gvdjAr?=
 =?utf-8?B?NjdMMVREQnpTald2TEJXeEtQaXdoTWVuWUVSWHNITWU3TkdwZXBScDY0TUp0?=
 =?utf-8?B?U3dBVnlHU1QyWlI3TDRSOExITnNBcU1rY1RsRWUzcEpsYVphNTZoK3pjNXlT?=
 =?utf-8?B?NGxRKzkwWStCN2QxRWZLS2dWQ0lhSGVPMmsvZFFIdHo1UDltd05aRm1tQmpM?=
 =?utf-8?B?NHJDRzNWSTNjM1FTK2hBV05xQjRtMWZyai9lZlFWQVRsdHdlbEVpczFwMzAw?=
 =?utf-8?B?YklVWlJkbUF2Y1RqS0FyV0FsazB4Tm0rMWlUTEYwNHhvQnViTmw2ZDNSRm9q?=
 =?utf-8?B?UFZZSlIrVjNWRG9nM1RuN0wzeU82cS9CVnEzTitHVlVITTJ3T2p3L1pvWGlT?=
 =?utf-8?B?NmR1MFY1MXFWcGlWVnFlNzcwa0lTclNFOVpCbVlCWktPTmRYTGNDWUJVdnIr?=
 =?utf-8?B?T2ZyQ3llTVJERjNnZFh0VWYzV0tFaHRwUFFDNng4ajl5cDAvUVdudkxrdnF6?=
 =?utf-8?B?MXNtOEV6YnBVekZmRS9MbktMM3VqK0UyUDlaRUFpNjBxSjJKZ1FUVEJlLytn?=
 =?utf-8?B?VE5UYm4wa0JMNVhlbUpQU0l0cnZDRXJiV2lGbnJkMUFQM0FzWkZ6aEpUKzdq?=
 =?utf-8?Q?UaERf9R+Z5TJuSvehJlGNgUA4RTjcCVesGQehav?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlAzOUFYeDdDSnJqd0hRUGdvTTV2cFJFNEpmNzVDeXMvWXpkNWk5M0o3ZnRs?=
 =?utf-8?B?L3M0RTNTZVFzUk1aQUJWYno2d2VqYjA2Uk1pYnVwNHhXUEd0aXN6K3NYaE5y?=
 =?utf-8?B?ZEJleEJ3aG10a1NzRkxIangxRVQwNDdLR1JKdWR6SEpGVnhqTTBmcGxwUjAr?=
 =?utf-8?B?b0xtekRpeGM0TkQ2dXA4VHZBRUZoTG8zeE81N0F1MEtrKzYwaUlzVVdUaUpz?=
 =?utf-8?B?Y29ZQXVEYlFHdXRTWDZ5azVlSFJSZTVHNUtEMGNZQ1ZHTUdpTVZyTm5na1J4?=
 =?utf-8?B?eGdjOVEvN1Avd2l3elRLWEdhVzIyem9ITDdRMXp4SjhIWjJhU3RsN2J3MWt6?=
 =?utf-8?B?RXRBSUlVUmUyTTBOYXZvZDZGTVpvNVorSTVIT1hHM3FTZUF2V0hEdUpOaHNC?=
 =?utf-8?B?cjZXUFZYTmpVTXhwUmNubFNvNEdrTDZGVmNzcFFKb1hGa2puWDZuMkdxcG9n?=
 =?utf-8?B?d2JTY24zTXdJSjNndmJDOXg2RkZkb2IxZXVWQzRLSk10TG5XbHJRRWlsd3JJ?=
 =?utf-8?B?RnJxKzRQVWoyOUhVYWJaSmh1UXh5cTJ1UTJ6WnlYaUYyZlpWTWhZSzUxaW1i?=
 =?utf-8?B?cm9TMCtBZkp4eU92eVJ1eHkvN0dGVm9UaHd4VlBjZFkvTElvRnUzRHhRRWFQ?=
 =?utf-8?B?VVF2Y2x3OHZGYzlkZGIvSFZoTTdhNzNIejBSQ2UzY0VYNmN1eW1mbnJIL3g3?=
 =?utf-8?B?K0RIdDV2Zm1CUEZ5UExiRXY5djJyNmNtYUExQ1BtaDRZL3BMM2dZb1pwd1dI?=
 =?utf-8?B?eGp4WTZrbFF4bk1FRHBCS0xCRWI1V3dHMnluaVZuY2QxWDB5MkR5bzlSUmdt?=
 =?utf-8?B?QzUyTnljK2xoVUp5UVRmQnJQNjBSUlU5a25MTE5hK2hIdG52QURrcG5jeXdm?=
 =?utf-8?B?YllYU082c3UzUjR1UHNsaVg4MDN2NTEwU2tQYS9jRk5BWVMwMkhqd2ljUGt2?=
 =?utf-8?B?ZW9hTjlvRm5hNzlkZVgxQ1RBVjdNTGJiYStpdGRsZ3U4VzRHelkydHhVZEM4?=
 =?utf-8?B?NDhmaWVFemE4YlZ3ajk4Y1hVVEp4WnNQazAvM1c1V2RpU0ZLMDhaL1gzUGFJ?=
 =?utf-8?B?ak4xbUFtdlFRQUNjOWJjNWhUVkdCOGFWRklvdC9OWHk2dTVvNnZTM0lyNkJx?=
 =?utf-8?B?bitLc1daMFRGWU5RUVZ5TjRnWCs5bVdMMnZpQzZqSDVlUzBTWENwbWZXNlpk?=
 =?utf-8?B?MFJlMGlRRnJPa3UwaTJhM1JXSVlQZFRYTnFSRlVDb3BwalhGUXlUTlpJZjZl?=
 =?utf-8?B?NFE2NDhRdExyYmRDTlJmQUhPY1FpaXc3eXB5RUJFb2IrUUVxMXc5cmlSRC9h?=
 =?utf-8?B?T014WTRYQ1p6Szh0R0FoeHRLT0sxbmtEWTZpNFBMWVZGQVRKckRWdmN5QnNE?=
 =?utf-8?B?TUNvcXZtbWRqZ0NrdW44MkZQS3lWd25mamFsb0xqOWgweExQNThGWkZHY1d2?=
 =?utf-8?B?b0NQQ3QreHFKWEd1ZWpBSlhqQ1BxZWtoVjF3eWVTcGQ0ZlEzREgxTE5WeE4v?=
 =?utf-8?B?M0dwc0V3eUpMTzZSZGkwbVJiYS9Zb3VDZ1RobGZHR2Fyc2NhVndhd3JQM3pZ?=
 =?utf-8?B?NUFXc0Zkc0ZTTll5S1M2R2lvYVZZUUFwdko2OGRYbFhEd0VmQUJlOVZmeHV4?=
 =?utf-8?B?VVJYQTFDek9mcHNWdTZhek9TQzVFSmY0QkdZTHFXNXVOQzNtUFBzd3RlM3pZ?=
 =?utf-8?B?T3RKbWlNT1pkSjdYUGNHRERJVkxkdEpyWlhXNTQxUml4a3FIcmFNK21nN2dx?=
 =?utf-8?B?QkJ4T1FzUm0vR05CVzVOSjg1RURLRDZGS281ek1OSFlVNDhIU1EvcDJ6WmRK?=
 =?utf-8?B?TDR0Zm5EWGE4NVdHSHFtRXU5Y1dvdVd5dld3M05JYStYc05rQXlwN2ZQNE5j?=
 =?utf-8?B?SjhOZ1VETVNZVDkrZUlqbllDNllBQ2g1dGFlVHFvSWNESGVJQ25QUEh0OEt0?=
 =?utf-8?B?NU54OHlqTVBoeDdnZ2xQUzBMdFpTMUQ5ZzV2UHhqWGY4cm5VdXQ2Nm1WV2Vw?=
 =?utf-8?B?ajd2eElqdjA4V0t4c1dySjN6UVZwMzFaRHdFdFNMWFN2LzNzcUErUHlYcStp?=
 =?utf-8?B?bGRoUENTK1FqcVMvMlBMSFZDM3p3VVdMUWxQbmE5MWJXanJyUVNVTGVabkxD?=
 =?utf-8?Q?rYIaeRIrp0gt6Qs2jXyP8VL2D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WjfxnYaqmTB8wHldQb2qvO7pUM2D2fgvWkHMylUO/7ddVXohwmjYlQeGGmAWLTYudTL42yth9DPowsdM2xKl81oU02obS7bmr17/BjrgXVZHkNcOUJi+W0gDY689wuqFWl8jb9hITpVwRuuc/PyIeGSGP3O6nQzcAwgofk/Y3HTgfA2JehaoB9g4gDEofecjFxzSEG7LiRVSbSc2lfgbUO1ar1vfV0LWIadgA8xmQTwXoZukG+heRtkaYVBnCPvqiyd0KQkiwhwWpzTXdMEwb41z45CBBbpZv1zjOC//Qv6ybP8qkyY+f45VQaVuNgp6H6ENfVYFh/GA2aDkSk2Q13WHVtBPlxWlxgAnr29dsvWulGmqvb2wEoxqVgY6r0IGX/D9U64ccc4Yy6JaeEZSw9BN92OXVSJS5cq3nePC+o+LllHw9lTqb0HUfXqvuOa+LvDIKWECgeyyaa5D/0CZ2AohRaasEVijJku9bMVWm3s4qphnGCSD0vG3tDZ92AxaxPtlkfinjhDFZbGu4kG7zGZWyN55JoBlvSHGxWD0Y/W5B2soyXyeVggMWQfqH0iEbTa+fuKNlfYZNidsd6tpVaPlSrCT6cbtAiU+fm/JNgM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dae29f-d144-4dbe-d003-08dcf85e9777
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 21:13:53.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD1Myzf6ekOq3j784HHyRcSdZ2KEEqUQQdD+5RmRM0tB4FtYT6D4s+/6ymnpw6oMumhKJYG4WLWZalgysX+qSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_16,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=862
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290160
X-Proofpoint-ORIG-GUID: OsbS8vGVR3jKxcHexXLa1FxJan7Z1VmW
X-Proofpoint-GUID: OsbS8vGVR3jKxcHexXLa1FxJan7Z1VmW

On 10/29/24 11:05, Kris Van Hees wrote:

> If memory serves me well,

It does.

> I think the plan was to change this test to not use
> chill at all (and remove the xfail), and introduce a new test that exercises
> the use of chill in the context of a clause that is a zero-size speculation.

v2 will have the slightly different name
"test: Clean up zero-size speculation + chill()".

> On Fri, Jul 19, 2024 at 07:38:33PM -0400, Eugene Loh wrote:
>> On 7/19/24 17:12, Kris Van Hees wrote:
>>
>>> On Thu, Jun 27, 2024 at 01:38:52AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>> Before I can really assess whether the annotation is valid,
>> Well, I'm pretty sure the annotation is right.
>>
>>> I'd like to know
>>> why chill) is even used here.  I.e. I don't quite understand the test :)
>> Well, I'm all with you on that.  I'm pretty sure the chill() is pretty
>> irrelevant and that the test is "valid" and passes without it.  I am of two
>> minds:
>>
>> 1)  Remove the chill() and @@xfail and move on.
>>
>> 2)  Be grateful for idiosyncrasies in the test suite, since they often turn
>> up bugs.  Weird tests turn up weird bugs.
>>
>> The patch was going with #2;  that get my vote.  I'm okay with #1, however.
>> Feel free to decide.
>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> ---
>>>>    test/unittest/speculation/tst.zerosize.d | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
>>>> index 56c1fcea..996f1257 100644
>>>> --- a/test/unittest/speculation/tst.zerosize.d
>>>> +++ b/test/unittest/speculation/tst.zerosize.d
>>>> @@ -5,7 +5,7 @@
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> -/* @@xfail: dtv2 */
>>>> +/* @@xfail: dtv2, chill not implemented yet */
>>>>    #pragma D option destructive
>>>> -- 
>>>> 2.18.4
>>>>
