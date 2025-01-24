Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782D13AC1
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704161; cv=fail; b=QZnz5phRDjTfvViHS2rjjwHm6YsfbLhh9XU5RT7zR1psXgIBTq0EDZ9A6TfBEIOqJD6hdIrLV1lgscfyYmjzruKq8qxSmcbOoCJOeagG4BEYLqUc1YemD4uxkpiPk7UAC4pn1Rc2yMhO35/xxTqfmgtSPPL3BrJ3qmo/X8hLwf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704161; c=relaxed/simple;
	bh=13blPduTrRe6izh+fQECPP0e3iryRKP0EE/GpYxEbeI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VV7t9ul9ZRg+Lcqm29btDN3Ah67Ck+ckRnuNASpx9lmHIVltQTjHVAKLVpSEVmDicifQQ1WE0p3z6CTkWDvl+ZXn1v/g3+Nsmrq40Gn/SjfWlVv6DrT+SSZeZPXIjg6dPdfMGJeWk9DlftOwL/VbCFpvKhZ24k1JU78NGePged4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FTT63tUf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G6CRsSfN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FTT63tUf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G6CRsSfN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O2Momm027648
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 07:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=O6QR2E69aYpQ+W8kpQIwDbIa+fJLmJrVyDK7Yw0lCLQ=; b=
	FTT63tUforY4BfaI1xLp6+BjJtEHv3kQpi3x000exqmgcplDKhGeAbLYZphpWXei
	ikB5MqqNASb2woz+GJFHnM3YqV6dmdIKkr/d35UJBVE52CIQxu4WO47oDcEUa7Ov
	3+nfHSH0RBAmadKsBJO3wbzjiyBtRW/ynijKG+EgV6D85/qKj2ha9UkFGvrQW7gp
	7U4JbYL7yeCqW7XsvRBy81SEHqAb2qOBqpBubFDuLQpqJsziNoqq2FZ31Nczqn7n
	CQxUpobpZuJMKEygQt8wf5+XJPDR5LBhrMao0vkIYuv2tuUZcUsgxK16tszM/D1+
	HfePXJr9hkp8ySrb37f6lg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44b96ajqse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 07:35:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50O7GQFh036509
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 07:35:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44917t66ed-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 07:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOj/AYjtkiDWL/ICscpave00tzhkwbKRv+xoFw1UK7h602R91KLYE3VijA6cMq1S8pXdtjusiXUUyrSqPh2myWpjxbiUQ1/7MjdyEPcI16D8b7nzIKdacUrevNRVF3EFAxfXg/Rk7czh5waJ9Z/RDJWeOPNBMusNVwHZtxdEdhOGcHep0YO4ADCUOukmX8JOyjM6WnNr6bhpoCfU/QkUI69bUKQ5vIao/jpX/QpGPhIh6iA/ZL1owC1GZn2noh8X/7G4u0JsOzijORfYo/62UFGW3kfuNLVRk9x2pLHZnuT3vHju6SNPgBuYM8XlQC0U2E/O9+a9St5oBd3Z0pS9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6QR2E69aYpQ+W8kpQIwDbIa+fJLmJrVyDK7Yw0lCLQ=;
 b=lCKD8TBwj2pp/tbaqCLcD/2CUstwNJNiT8t60+8EAuQtpquytPZfR8mv5tRicny0a74If2qB/AzR+wcyQYWxaKSqWrVE4wCw+b1fVZlN/lygeJ4KZXJxZErRbYc4nKU0au3SJ7YaAqIWxaSyeWg9qeNmQwinVAh7JjBBkI3vlWrMPNAYkNTrkMorx8Jre/PNnsicXdI1x57uAAcsZhQSBYkgJUp8mzoEMkT5giixMWSrmldVjiNV9jJxqLvqk6phIlmmZoMXAvct3SAhtZEI2Rm7TNHH2uXBt7wSAOfi0bSPzzWLax0b7tQTilrios0k56m+BCYxDkAPbG3SB/S7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6QR2E69aYpQ+W8kpQIwDbIa+fJLmJrVyDK7Yw0lCLQ=;
 b=G6CRsSfNiE0U7jMRXyboTdFhqoNb2JLoXO2xGMgRMV3yxbWrj8HtWsJzxECFzy4C9vWHc7WIUz5XD4aSqVgjzs2xKlRCK9pKmxn2wu8pB8LjDb3RFVIbYc0r2+vmwSvBYN05GqsDdzhcneaBGKN2iq9IYBcU+wAZqv5RxC/dS84=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB8221.namprd10.prod.outlook.com (2603:10b6:8:1ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 07:35:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 07:35:53 +0000
Message-ID: <252a8cc4-0bcc-a41c-997d-f5c264c1ed1c@oracle.com>
Date: Fri, 24 Jan 2025 02:35:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] bpf: separate bvar implementation into separate functions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB6337FA3F91721239230015A6C2E32@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB6337FA3F91721239230015A6C2E32@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 0372af45-736c-45d2-7a35-08dd3c49bb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1dURVZoZmhha1VGam53c2xQVzRDaXoxZC8vcnVyTnBwblVFUjFFd0RWRk1y?=
 =?utf-8?B?UDBZb3BtNkVwenRYUjhYYzAvYS9FeSsycWpaYVBQMzNQeml4d21WNlVhNDlY?=
 =?utf-8?B?cWtlVFR0SForYkE1b2pPaUpMSXR4WkhRMHJZSGxhY0N5ZjgrWUp1LytOWE8z?=
 =?utf-8?B?dWJpeGUveHFTNExBVWVyeVNJdE0veHdqaDdzR3VWeWhGYVBkN09pbk1wQnQ5?=
 =?utf-8?B?VE1Sc29nZ3RsRjdKN3RaZS85b1VsUCtLRVhLclN2ekxUYXFhUzk5c0hsUGxI?=
 =?utf-8?B?d0dKdmtKZHRTM1RzY0tzUnI3L2hWNnM4TWZ6R2pvNnBLYUU3UGZRSUlaTG40?=
 =?utf-8?B?dTMrc3U5cEVlbC9qL3BBbzVacWt2bDFOVDFqbW9uM2NvdDdIbmxDK0pGQWJl?=
 =?utf-8?B?ejRuWE9GUjIwWGRzaTg0SitLdkVLRm45V0ViU2RGRm90MGhiUWVWU09DL0Y3?=
 =?utf-8?B?OTNpL0hGTldzL1JtaEJZTU1ndUFtV2hRV0dQRXczSHNpYyt1L0VjKzcybVB4?=
 =?utf-8?B?UnlhclBFU1JqT3RaNGcwNFFBS0xTRkh0eitPVzlETk5iZytVTlpFM3BEZ1gy?=
 =?utf-8?B?VC9UVVhBaCszekloVzVGVHRYdTRwYnJJVzkyTTNCTUZyMkNpVHRBM3BnT1pi?=
 =?utf-8?B?SFhEZklSUXRzSmI1VFJ5RGRpRENtdzRwK3hJbWtOVUlIUjBlQUdJeVNGVzEr?=
 =?utf-8?B?RkZrNEU5MGJwdXBNQUNCZTIwajVaM1FXSGFrNTVRNXRXc1N5eTdjM1BCc25O?=
 =?utf-8?B?bFVwL0E1aUxOams1TVNZV1dkWkxISXJCNHVxS1dtVkxMcjhMN0J1Vjd4R0J0?=
 =?utf-8?B?Tml5Ti9ieFd5dm1TcGZXK0NQWU8wSDF5aVBHeVF1c250dXRsQlhkdWkyNER5?=
 =?utf-8?B?R2paQUQwUGU3ZW9idm1LVWZCTDRVS2ZMaktRa3NuK1ZBSGxyc1V2MjdBa0Yy?=
 =?utf-8?B?MWNkQ3RmRTMyanpYb2JXQklZVUJEQmlNUHo0bStCZ3BnNTJXekhZWVFHTVdk?=
 =?utf-8?B?bGZmWEtuUUJOUGVmQWhScEtSalZmbFFVb2pGUkN5YWxmbVBzcExMY1BCQXNQ?=
 =?utf-8?B?TDAvUTA2ejl5blQweWJYVGN1Q3czZnlZYWxNbkhjdFJXQ3FvNXVSTnQxOUxB?=
 =?utf-8?B?cmNldURKcTFOVXhTT1BXcmw0RTVRdGcyNGJuUmNleEJQMTNnbzJxV3ZvMkph?=
 =?utf-8?B?V1AwZ0VJanFHY0RncVNpQ2FBVGViZVN0RXFZV0I1UGhvbkg3UHUvWHAxcHA2?=
 =?utf-8?B?ZXJNejI0SW5QS1hQUnFidUNHZGxLd1R3Y3pXaWRrTCtjMVoyUnIvdmd3ZFlh?=
 =?utf-8?B?T1ZiODF6cEtIS3ppd1ltck96emh6MGxUL2FqdHlBSGV1dzZkcU9BMzdaMEkr?=
 =?utf-8?B?ZGk2dUlzc3ZvcGhreTUrUUtuZ0xjTWlzbldjZWJtUUwwTmxBb0h6ZnFDaTZy?=
 =?utf-8?B?M0E2bHFINEFWRHQ5UUUwd2tMSWhzY3QyYkg0RUhOSGFwZ1NSZS9neDhUV0R2?=
 =?utf-8?B?VGpFZTc3eUwweThZMExOU3R2clRXTW1zVkRiMzBjbnUyM3NYSk5HNUFVQXJN?=
 =?utf-8?B?NFB0SW1ldHJKOGlmZE9odG0rWEVOdXNGMTU2WHhMSVVNTGRiMERpZGZoZUpP?=
 =?utf-8?B?d2FXTURtSkdpcEwveXkwM3ErRGtGRStybEc0aEhKM1Vaa2pqUUxObjFCeHZw?=
 =?utf-8?B?QTRwLzJzbGRYa3JBS0dIRHk5M0o0ZmQrdWhvaVhSM2grTndjSTlQZ0ppdFZZ?=
 =?utf-8?B?ejM3TzZlQjZXZmVFTWhKWTR0Ym0vK1VMa0hqYjJFTTF2Y2xDV01GSlh2OWpO?=
 =?utf-8?B?WHkySE55V3FUR1FIcHB1dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1RUNDROb0ZaT2c1UmIyYlpOS0VzcjlKSGphV002RldJb1UybEtCRmtBYmdl?=
 =?utf-8?B?NzEzVkRRdUdHdHhvNWJvNDJWL1ZUSXo1Y0sxcGU0dksvSm16cmIvSHBIcHBz?=
 =?utf-8?B?TW1wZmZiL09JdVZpNU5oVlJnUm4xZy9kNk1lS2xMaDNkcVQwSm9PYW5meWF4?=
 =?utf-8?B?V201cHNGOXBRWlhjTHBZejJDdXM0Skt1NXBhYTdPcDNJQktzeEtRamNIK2E4?=
 =?utf-8?B?eUhDQzBFZTJYWmtVWDN2UkZxcEdVR2RycExGalNFQlhHdEpFdEk3UEVOSlpp?=
 =?utf-8?B?YTd4czk4dHphbXQrT1JpOGZYSXRzU0JyN1MzTGd2VFhpWkYrYnFZVnM2RlRG?=
 =?utf-8?B?WVQwQnNab2xWSjFJdFgvVHpWN3dpZmlidWMvbmEvUE9WaU5EVnUvWjVPejI3?=
 =?utf-8?B?ZTlrbTduTEY4cVgraTdkVFNtM0tzd2NEZFhoa0tMNllaL3o0VTgrREVZdkd6?=
 =?utf-8?B?bmZlL25PRTBWWGxGUVAvcHZMaDhiRC92MEVLOEJYYjV1TjdoL1VlalczcnpX?=
 =?utf-8?B?bjNyQlo3VVNSVjc2TWcraGhscm1YSi9QVUxVUnZlNWNIYm1DWTl4MTVLam9T?=
 =?utf-8?B?TUQ3U0lGdVM3dkNPbk5IWUlQTXdlTlE1dWtLM1VzMFU5alhZUHVqaW1zYXpr?=
 =?utf-8?B?UVdheE5Xekl0TEtRa3BwS2V1ejVLNlp6WDRzY1Z0Yk10QTVxWkl1S1R2SUtx?=
 =?utf-8?B?L09KMUU5RjVzaHhlYjFVaFZxc3p1ME4waTRoaW85KzhzNjI1QkVCQkpiQnNN?=
 =?utf-8?B?bVRyQ1pBZWdxTnVMVi9hOURrQStxR3NGMFhIc3dFbXJ4KzVTS3VjZXBKTFY5?=
 =?utf-8?B?Vk9QYzFDRmM1cmphMDBIZWNJMEczNDl0dys4MTlPdDVpdEpJU045RGs0N1ht?=
 =?utf-8?B?RG5XRWVocndaeUg0eHBMaXpwd3hOYlZnR3l6MGFXNi8zbGpIN3dZRXBhaXpk?=
 =?utf-8?B?REhqa0w2SGZpVFJMay9SN1ZZQTFWdnR2Rk9XcUdlNk5pQUlmZC9JaWs2VWky?=
 =?utf-8?B?K1RBOHAva1hlM3Uzd1hwM21jVmM1eFNPZXZTSTd6dFY2SUdBU3dGZEozZ1VJ?=
 =?utf-8?B?Sm9tL05WMGNaOUVXRStiT2h5cFl3bGxXU3AxNG4xL1AwU2Qra2pwR1NPWXNS?=
 =?utf-8?B?a3NLYmh6VmtpUVN5a0tWVnBScnFmYlc1aEEzNG1JMWFtYVNxbkRaMW5jTmI5?=
 =?utf-8?B?MDAybktVakwxNmovNGlPZzhrZWVkYXYra0EyZHoyaU1iRDVGYmdrbjhFN2k0?=
 =?utf-8?B?c2NvSXpkbzc0dlVSSVBNazRYTXo3aXFoUTY3SmNqeDdCc29CS0tHbytvTTdF?=
 =?utf-8?B?V01sL0JLOGRvZW9ISHVHZTQ4OW0xdnpBS2piSTUvaUFKZldyWngwTHNrNm1M?=
 =?utf-8?B?Ull1dlJ5citlVnFRbmw4b3dackJkZzdGMUJTbE5oRjIzak1mQnJmZnNmd0dR?=
 =?utf-8?B?a1NCNk1UNk5BcnROZ01Wb2RUNlRoSmoweHZHM0MwVk1CMVY2YW5STEFJZnps?=
 =?utf-8?B?OWpNVERzUmJ1K1BCNVZNNnU5amg2cFhyVGRYNWxmOHR2T3lMVzdHc1dURk1K?=
 =?utf-8?B?V0tSK3dQMmpFaUhwcWZHT0U1QS9YbDBNckdwNjRKMFhuNG9oY0JGWXhDeXJm?=
 =?utf-8?B?UWVYU3JoRE1xVFJ0WGthdUtWWmZYWTk4dGNDRkp6S29FeDFTWTlIbzZDQVpZ?=
 =?utf-8?B?LzNhVHZwWE5FWVU3ZVFqMklNL0tYZE4rVnRrM0NQTklNdkVUaW0xMlRqTnNl?=
 =?utf-8?B?cUcwUHRnbFJDRkV2KzdVRzhGdjI1MWJtQTVKTjJoVWt1QXZzK3ltclJrY1pp?=
 =?utf-8?B?T1BRb0NzZ0l5TS9BVkNMZVphaFRZVlBpNUtzaWttbFhUaUFtUW1lTzhrYnVN?=
 =?utf-8?B?N0tBc0x0OHRnOVhBSFAwVXJFSUJWdXBjN3JpT0h3SXlNczdUVXVKd3REV25O?=
 =?utf-8?B?blRuZmRhM1FBV0pWK0ZKckp3SWh3bHRyZjBSendVSithZmtWZEFFeDhWZS9F?=
 =?utf-8?B?ZGo1SHBJS2l6OUd5ZWtYakVTeGI5Nk9GbEtvdUhqN1p2b3RhdkIrLzYxRCt4?=
 =?utf-8?B?a3hidkNaeGZObXVVTTdjWnp2ZDZzci80UEgvZm93L1ovcHRkQ2pyZVBTZVVx?=
 =?utf-8?Q?LpFSDxZm0FE8ZAT1KtUeYOXIY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PRBSjXassW2cui3T5PlWWptQomQSLDsnioCbvGNMOR9r0CsTfjyfkC0soFoJOIe9ycFXh1qBUE4HSdGbA5ZvdvWS5TEZPg9VaE4LvZI852SuNL7hrVHI0wMu4UOJl/lVmbyn2pNNd8Yud5MMGlWuUaSE/2xRPgY3qtfdI4J4KdVDz5JsXudgEHCwuISpHE1BdqoHyKlK6GZt0E6wFub8h0jUQyx/2E1EZ/AnpQaaT7JTMB06VCOx3XlXLcXwHJAcZ4s6Hmmei1LHMHjlJC5eh8OueLeabB+u26FJGsFkap2nU9wRX7N7achVgVuyvYhsHgnM6FfSWr39pOwpTLpJ8Z1SzG9qWqyEUa3m1eIS0ZnZ/ynUdzRdOoDGLptxIjqqpJ3hoHRZgvT25wgqTtpXOrfEm9JHpzOknbqDe/QUxNsPoCrczMEDnj0OguIUqnKvZI+2p+5HDNl3bukYW5fyOQhPnwz5yVjUjYFY8t7kzc4XlMIEsE22sW2rQ/2Vod5huxzkqIMKSDmDL+m95wE7zdgnfOlF2oIWYYI56wccGS+xzARZS2yvFBo7fTKGZJzRMYLyc8lDkx4XGUYg+OiVnGT7Iqc5fR1ysD5G+gb+otQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0372af45-736c-45d2-7a35-08dd3c49bb65
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 07:35:53.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD6N7B6L9/Lrvb/x24vDpvBWD+OBuaZsaSnTnby4tCuBBWokGcV61A3FSG96maCsDY+UXd3Ak0mgsp/gR7IFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501240053
X-Proofpoint-GUID: wa8qrDnxjjIeEh-LlXga6z2ztAd6bfCV
X-Proofpoint-ORIG-GUID: wa8qrDnxjjIeEh-LlXga6z2ztAd6bfCV

I think I'm on board with this patch, but two questions.

1.  There is DIF_VAR_EXECARGS stuff in two places.  Is that stuff in the 
wrong patch?

2.  I'm confused why
         test/demo/builtin/ipl.d
         test/demo/builtin/vtimestamp.d
were passing:  there was no ipl or vtimestamp support before and there 
is none now.  Presumably, the tests used to time out... so why was that 
considered a PASS?  I guess I see why 
test/unittest/buffering/tst.cputime.sh used to pass, but maybe that 
suggests that the test needs to be tightened up and be made quite a bit 
more discriminating.

On 1/23/25 22:48, Kris Van Hees wrote:
> The handling of builtin variables was done with a single big function
> that therefore got linked into every single BPF program (twice if the
> builtin variable might raise a fault).  Providing separate functions
> for most builtin variables reduces BPF program size significantly.
>
> This also reduces pressure on the BPF verifies.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/get_bvar.c                          | 412 +++++++++++++-----------
>   include/dtrace/dif_defines.h            |   1 +
>   libdtrace/dt_cg.c                       |  39 ++-
>   libdtrace/dt_dis.c                      |  57 +++-
>   libdtrace/dt_open.c                     |   2 +
>   test/demo/builtin/ipl.d                 |   2 +
>   test/demo/builtin/vtimestamp.d          |   2 +
>   test/demo/io/iocpu.d                    |   2 +
>   test/unittest/buffering/tst.cputime.sh  |   1 +
>   test/unittest/disasm/tst.ann-bvar.r     |  69 ++--
>   test/unittest/disasm/tst.ann-bvar.sh    |   9 +-
>   test/unittest/disasm/tst.vartab-bvar.r  |   2 -
>   test/unittest/disasm/tst.vartab-bvar.sh |   7 +-
>   13 files changed, 360 insertions(+), 245 deletions(-)
>
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 1c0fa884..c760126d 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -19,18 +19,21 @@
>   # define noinline	__attribute__((noinline))
>   #endif
>   
> -extern struct bpf_map_def cpuinfo;
> -extern struct bpf_map_def probes;
> -extern struct bpf_map_def state;
> -extern struct bpf_map_def usdt_names;
> -
> -extern uint64_t PC;
> -extern uint64_t STBSZ;
> -extern uint64_t STKSIZ;
> -extern uint64_t BOOTTM;
> +extern struct bpf_map_def	cpuinfo;
> +extern struct bpf_map_def	probes;
> +extern struct bpf_map_def	state;
> +extern struct bpf_map_def	usdt_names;
> +
> +extern uint64_t	BOOTTM;
> +extern uint64_t	NPROBES;
> +extern uint64_t	PC;
> +extern uint64_t	STBSZ;
> +extern uint64_t	STKSIZ;
>   extern uint64_t STACK_OFF;
> -extern uint64_t STACK_SKIP;
> -extern uint64_t NPROBES;
> +extern uint64_t	STACK_SKIP;
> +extern uint64_t	TASK_COMM;
> +extern uint64_t	TASK_REAL_PARENT;
> +extern uint64_t	TASK_TGID;
>   
>   #define error(dctx, fault, illval) \
>   	({ \
> @@ -38,198 +41,231 @@ extern uint64_t NPROBES;
>   		-1; \
>   	})
>   
> -noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
> +noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
>   {
>   	dt_mstate_t	*mst = dctx->mst;
>   
> -	switch (id) {
> -	case DIF_VAR_CURTHREAD:
> -		return bpf_get_current_task();
> -	case DIF_VAR_TIMESTAMP:
> -		if (mst->tstamp == 0)
> -			mst->tstamp = bpf_ktime_get_ns();
> +	if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
> +		return error(dctx, DTRACEFLT_ILLOP, 0);
>   
> -		return mst->tstamp;
> -	case DIF_VAR_EPID: {
> -		return (((uint64_t)mst->prid) << 32) | mst->stid;
> -	}
> -	case DIF_VAR_ID:
> -		return mst->prid;
> -	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
> -	case DIF_VAR_ARG3: case DIF_VAR_ARG4: case DIF_VAR_ARG5:
> -	case DIF_VAR_ARG6: case DIF_VAR_ARG7: case DIF_VAR_ARG8:
> -	case DIF_VAR_ARG9:
> -		return mst->argv[id - DIF_VAR_ARG0];
> -	case DIF_VAR_ARGS:
> -		if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
> -			return error(dctx, DTRACEFLT_ILLOP, 0);
> -
> -		return mst->argv[idx];
> -	case DIF_VAR_STACKDEPTH:
> -	case DIF_VAR_USTACKDEPTH: {
> -		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> -		uint64_t flags;
> -		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
> -		uint64_t stacksize;
> -
> -		if (id == DIF_VAR_USTACKDEPTH)
> -			flags = BPF_F_USER_STACK;
> -		else
> -			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
> -
> -		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
> -		if (stacksize < 0)
> -			return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> +	return mst->argv[idx];
> +}
> +
> +noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
> +{
> +	uint64_t	buf[2] = { 0, };
>   
> +	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
> +			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
> +		return 0;
> +
> +	return buf[1];
> +}
> +
> +noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
> +{
> +	uint32_t	key = 0;
> +	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> +
> +	if (val == NULL) {
>   		/*
> -		 * While linux/bpf.h does not describe the meaning of
> -		 * bpf_get_stack()'s return value outside of its sign,
> -		 * it is presumably the length of the copied stack.
> -		 *
> -		 * If stacksize==bufsiz, presumably the stack is larger than
> -		 * what we can retrieve.  But it's also possible that the
> -		 * buffer was exactly large enough.  So, leave it to the user
> -		 * to interpret the result.
> +		 * Typically, we would use 'return error(...);' but
> +		 * that confuses the verifier because it returns -1.
> +		 * So, instead, we explicitly return 0.
>   		 */
> -		return stacksize / sizeof(uint64_t);
> -	}
> -	case DIF_VAR_CALLER:
> -	case DIF_VAR_UCALLER: {
> -		uint64_t flags;
> -		uint64_t buf[2] = { 0, };
> -
> -		if (id == DIF_VAR_UCALLER)
> -			flags = BPF_F_USER_STACK;
> -		else
> -			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
> -
> -		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
> -			return 0;
> -		return buf[1];
> +		error(dctx, DTRACEFLT_ILLOP, 0);
> +		return 0;
>   	}
> -	case DIF_VAR_PROBEPROV:
> -	case DIF_VAR_PROBEMOD:
> -	case DIF_VAR_PROBEFUNC:
> -	case DIF_VAR_PROBENAME: {
> -		uint32_t	key = mst->prid;
> -
> -		if (key < ((uint64_t)&NPROBES)) {
> -			dt_bpf_probe_t	*pinfo;
> -			uint64_t	off;
> -
> -			pinfo = bpf_map_lookup_elem(&probes, &key);
> -			if (pinfo == NULL)
> -				return (uint64_t)dctx->strtab;
> -
> -			switch (id) {
> -			case DIF_VAR_PROBEPROV:
> -				off = pinfo->prv;
> -				break;
> -			case DIF_VAR_PROBEMOD:
> -				off = pinfo->mod;
> -				break;
> -			case DIF_VAR_PROBEFUNC:
> -				off = pinfo->fun;
> -				break;
> -			case DIF_VAR_PROBENAME:
> -				off = pinfo->prb;
> -			}
> -			if (off > (uint64_t)&STBSZ)
> -				return (uint64_t)dctx->strtab;
> -
> -			return (uint64_t)(dctx->strtab + off);
> -		} else {
> -			char *s;
> -
> -			s = bpf_map_lookup_elem(&usdt_names, &key);
> -			if (s == NULL)
> -				return (uint64_t)dctx->strtab;
> -
> -			switch (id) {
> -			case DIF_VAR_PROBENAME:
> -				s += DTRACE_FUNCNAMELEN;
> -			case DIF_VAR_PROBEFUNC:
> -				s += DTRACE_MODNAMELEN;
> -			case DIF_VAR_PROBEMOD:
> -				s += DTRACE_PROVNAMELEN;
> -			case DIF_VAR_PROBEPROV:
> -			}
> -
> -			return (uint64_t)s;
> -		}
> -	}
> -	case DIF_VAR_PID: {
> -		uint64_t	val = bpf_get_current_pid_tgid();
>   
> -		return val >> 32;
> -	}
> -	case DIF_VAR_TID: {
> -		uint64_t	val = bpf_get_current_pid_tgid();
> +	return (uint64_t)val;
> +}
>   
> -		return val & 0x00000000ffffffffUL;
> -	}
> -	case DIF_VAR_EXECNAME: {
> -		uint64_t	ptr;
> -		extern uint64_t	TASK_COMM;
> +noinline uint64_t dt_bvar_curthread(const dt_dctx_t *dctx)
> +{
> +	return bpf_get_current_task();
> +}
>   
> -		/* &(current->comm) */
> -		ptr = bpf_get_current_task();
> -		if (ptr == 0)
> -			return error(dctx, DTRACEFLT_BADADDR, ptr);
> +noinline uint64_t dt_bvar_epid(const dt_dctx_t *dctx)
> +{
> +	dt_mstate_t	*mst = dctx->mst;
>   
> -		return (uint64_t)ptr + (uint64_t)&TASK_COMM;
> -	}
> -	case DIF_VAR_WALLTIMESTAMP:
> -		return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
> -	case DIF_VAR_PPID: {
> -		uint64_t	ptr;
> -		int32_t		val = -1;
> -		extern uint64_t	TASK_REAL_PARENT;
> -		extern uint64_t	TASK_TGID;
> -
> -		/* Chase pointers val = current->real_parent->tgid. */
> -		ptr = bpf_get_current_task();
> -		if (ptr == 0)
> -			return error(dctx, DTRACEFLT_BADADDR, ptr);
> -		if (bpf_probe_read((void *)&ptr, 8,
> -		    (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
> -			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
> -		if (bpf_probe_read((void *)&val, 4,
> -		    (const void *)(ptr + (uint64_t)&TASK_TGID)))
> -			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
> -
> -		return (uint64_t)val;
> -	}
> -	case DIF_VAR_UID: {
> -		uint64_t	val = bpf_get_current_uid_gid();
> +	return (((uint64_t)mst->prid) << 32) | mst->stid;
> +}
>   
> -		return val & 0x00000000ffffffffUL;
> -	}
> -	case DIF_VAR_GID: {
> -		uint64_t	val = bpf_get_current_uid_gid();
> +noinline uint64_t dt_bvar_errno(const dt_dctx_t *dctx)
> +{
> +	dt_mstate_t	*mst = dctx->mst;
>   
> -		return val >> 32;
> -	}
> -	case DIF_VAR_ERRNO:
> -		return mst->syscall_errno;
> -	case DIF_VAR_CURCPU: {
> -		uint32_t	key = 0;
> -		void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> -
> -		if (val == NULL) {
> -			/*
> -			 * Typically, we would use 'return error(...);' but
> -			 * that confuses the verifier because it returns -1.
> -			 * So, instead, we explicitly return 0.
> -			 */
> -			error(dctx, DTRACEFLT_ILLOP, 0);
> -			return 0;
> +	return mst->syscall_errno;
> +}
> +
> +noinline uint64_t dt_bvar_execname(const dt_dctx_t *dctx)
> +{
> +	uint64_t	ptr;
> +
> +	/* &(current->comm) */
> +	ptr = bpf_get_current_task();
> +	if (ptr == 0)
> +		return error(dctx, DTRACEFLT_BADADDR, ptr);
> +
> +	return (uint64_t)ptr + (uint64_t)&TASK_COMM;
> +}
> +
> +noinline uint64_t dt_bvar_gid(const dt_dctx_t *dctx)
> +{
> +	return bpf_get_current_uid_gid() >> 32;
> +}
> +
> +noinline uint64_t dt_bvar_id(const dt_dctx_t *dctx)
> +{
> +	dt_mstate_t	*mst = dctx->mst;
> +
> +	return mst->prid;
> +}
> +
> +noinline uint64_t dt_bvar_pid(const dt_dctx_t *dctx)
> +{
> +	return bpf_get_current_pid_tgid() >> 32;
> +}
> +
> +noinline uint64_t dt_bvar_ppid(const dt_dctx_t *dctx)
> +{
> +	uint64_t	ptr;
> +	int32_t		val = -1;
> +
> +	/* Chase pointers val = current->real_parent->tgid. */
> +	ptr = bpf_get_current_task();
> +	if (ptr == 0)
> +		return error(dctx, DTRACEFLT_BADADDR, ptr);
> +	if (bpf_probe_read((void *)&ptr, 8,
> +			   (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
> +		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
> +	if (bpf_probe_read((void *)&val, 4,
> +			   (const void *)(ptr + (uint64_t)&TASK_TGID)))
> +		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
> +
> +	return (uint64_t)val;
> +}
> +
> +noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
> +{
> +	dt_mstate_t			*mst = dctx->mst;
> +	uint32_t			key = mst->prid;
> +
> +	if (key < ((uint64_t)&NPROBES)) {
> +		dt_bpf_probe_t	*pinfo;
> +		uint64_t	off = 0;
> +
> +		pinfo = bpf_map_lookup_elem(&probes, &key);
> +		if (pinfo == NULL)
> +			return (uint64_t)dctx->strtab;
> +
> +		switch (idx) {
> +		case DIF_VAR_PROBEPROV:
> +			off = pinfo->prv;
> +			break;
> +		case DIF_VAR_PROBEMOD:
> +			off = pinfo->mod;
> +			break;
> +		case DIF_VAR_PROBEFUNC:
> +			off = pinfo->fun;
> +			break;
> +		case DIF_VAR_PROBENAME:
> +			off = pinfo->prb;
>   		}
> +		if (off > (uint64_t)&STBSZ)
> +			return (uint64_t)dctx->strtab;
>   
> -		return (uint64_t)val;
> -	}
> -	default:
> -		/* Not implemented yet. */
> -		return error(dctx, DTRACEFLT_ILLOP, 0);
> +		return (uint64_t)(dctx->strtab + off);
> +	} else {
> +		char	*s;
> +
> +		s = bpf_map_lookup_elem(&usdt_names, &key);
> +		if (s == NULL)
> +			return (uint64_t)dctx->strtab;
> +
> +		switch (idx) {
> +		case DIF_VAR_PROBEPROV:
> +			s += DTRACE_FUNCNAMELEN;
> +		case DIF_VAR_PROBEMOD:
> +			s += DTRACE_MODNAMELEN;
> +		case DIF_VAR_PROBEFUNC:
> +			s += DTRACE_PROVNAMELEN;
> +		case DIF_VAR_PROBENAME:
> +		}
> +
> +		return (uint64_t)s;
>   	}
>   }
> +
> +noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
> +{
> +	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> +	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
> +	uint64_t	retv;
> +
> +	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
> +			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
> +	if (retv < 0)
> +		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> +
> +	/*
> +	 * While linux/bpf.h does not describe the meaning of bpf_get_stack()'s
> +	 * return value outside of its sign, it is presumably the length of the
> +	 * copied stack.
> +	 *
> +	 * If retv==bufsiz, presumably the stack is larger than what we
> +	 * can retrieve.  But it's also possible that the buffer was exactly
> +	 * large enough.  So, leave it to the user to interpret the result.
> +	 */
> +	return retv / sizeof(uint64_t);
> +}
> +
> +noinline uint64_t dt_bvar_tid(const dt_dctx_t *dctx)
> +{
> +	return bpf_get_current_pid_tgid() & 0x00000000ffffffffUL;
> +}
> +
> +noinline uint64_t dt_bvar_timestamp(const dt_dctx_t *dctx)
> +{
> +	dt_mstate_t	*mst = dctx->mst;
> +
> +	if (mst->tstamp == 0)
> +		mst->tstamp = bpf_ktime_get_ns();
> +
> +	return mst->tstamp;
> +}
> +
> +noinline uint64_t dt_bvar_ucaller(const dt_dctx_t *dctx)
> +{
> +	uint64_t buf[2] = { 0, };
> +
> +	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), BPF_F_USER_STACK) < 0)
> +		return 0;
> +
> +	return buf[1];
> +}
> +
> +noinline uint64_t dt_bvar_uid(const dt_dctx_t *dctx)
> +{
> +	return bpf_get_current_uid_gid() & 0x00000000ffffffffUL;
> +}
> +
> +noinline uint64_t dt_bvar_ustackdepth(const dt_dctx_t *dctx)
> +{
> +	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> +	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
> +	uint64_t	retv;
> +
> +	retv = bpf_get_stack(dctx->ctx, buf, bufsiz, BPF_F_USER_STACK);
> +	if (retv < 0)
> +		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> +
> +	/* See dt_bvar_stackdepth() above. */
> +	return retv / sizeof(uint64_t);
> +}
> +
> +noinline uint64_t dt_bvar_walltimestamp(const dt_dctx_t *dctx)
> +{
> +	return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
> +}
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index c8c1d961..9f6e3b55 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -162,6 +162,7 @@
>   #define DIF_VAR_GID		0x011f
>   #define DIF_VAR_ERRNO		0x0120
>   #define DIF_VAR_CURCPU		0x0121
> +#define DIF_VAR_EXECARGS	0x0122
>   
>   #define DIF_SUBR_RAND			0
>   #define DIF_SUBR_MUTEX_OWNED		1
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index e7e3a132..6e74b4b0 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -3197,6 +3197,7 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   {
>   	dt_ident_t	*idp = dt_ident_resolve(dnp->dn_ident);
>   	dt_ident_t	*fnp;
> +	uint32_t	idx = UINT32_MAX;
>   
>   	idp->di_flags |= DT_IDFLG_DIFR;
>   
> @@ -3298,15 +3299,38 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   		return;
>   	}
>   
> -	/* built-in variables */
> +	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> +	/* Special case for arg0 through arg9; encode as args[n] */
> +	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
> +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
> +		idx = idp->di_id - DIF_VAR_ARG0;
> +	} else if (idp->di_id == DIF_VAR_PROBEPROV ||
> +		   idp->di_id == DIF_VAR_PROBEMOD ||
> +		   idp->di_id == DIF_VAR_PROBEFUNC ||
> +		   idp->di_id == DIF_VAR_PROBENAME) {
> +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
> +		idx = idp->di_id;
> +	} else {
> +		char	*fn;
> +
> +		if (asprintf(&fn, "dt_bvar_%s", idp->di_name) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> +
> +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, fn);
> +		free(fn);
> +	}
> +
> +	/* No implementing function found - report ILLOP. */
> +	if (fnp == NULL)
> +		xyerror(D_IDENT_UNDEF,
> +			"built-in variable '%s' not implemented", idp->di_name);
> +
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_3, 0));
> -	fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
> -	assert(fnp != NULL);
> +	if (idx != UINT32_MAX)
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, idx));
>   	dt_regset_xalloc(drp, BPF_REG_0);
>   	emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
>   	dt_regset_free_args(drp);
> @@ -5065,7 +5089,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	dt_probe_t	*prp = yypcb->pcb_probe;
>   	uintmax_t	saved = dnp->dn_args->dn_value;
>   	dt_ident_t	*idp = dnp->dn_ident;
> -	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
> +	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
>   	size_t		size;
>   	int		n;
>   	int		ustr = 0;
> @@ -5135,8 +5159,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
> -	emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, dnp->dn_reg));
>   	dt_regset_xalloc(drp, BPF_REG_0);
>   	emite(dlp, BPF_CALL_FUNC(fidp->di_id), fidp);
>   	dt_regset_free_args(drp);
> diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
> index 9f319d70..d983c099 100644
> --- a/libdtrace/dt_dis.c
> +++ b/libdtrace/dt_dis.c
> @@ -364,16 +364,57 @@ static char *
>   dt_dis_bpf_args(const dtrace_difo_t *dp, const char *fn,
>   		const struct bpf_insn *in, char *buf, size_t len, uint_t addr)
>   {
> -	if (strcmp(fn, "dt_get_bvar") == 0) {
> +	if (strcmp(fn, "dt_bvar_args") == 0) {
>   		/*
> -		 * We know that the previous two instructions exist and move
> -		 * the variable id to a register in the first instruction of
> -		 * that sequence (because we wrote the code generator to emit
> -		 * the instructions in this exact order.)
> +		 * We need to support two cases:
> +		 *  - access to argN:
> +		 *	lddw %r1, dctx
> +		 *	mov  %r2, N
> +		 *	call dt_bvar_args
> +		 *  - access to args[N]:
> +		 *	mov  %rX, N
> +		 *	lddw %r1, dctx
> +		 *	mov  %r2, %rX
> +		 *	call dt_bvar_args
>   		 */
> -		in -= 2;
> -		snprintf(buf, len, "%s",
> -			 dt_dis_varname_id(dp, in->imm, DIFV_SCOPE_GLOBAL, addr));
> +		in--;
> +		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2) {
> +			if (BPF_SRC(in->code) == BPF_K) {
> +				snprintf(buf, len, "arg%d", in->imm);
> +				return buf;
> +			}
> +
> +			in -= 2;
> +			if (BPF_OP(in->code) == BPF_MOV &&
> +			    BPF_SRC(in->code) == BPF_K &&
> +			    in->dst_reg == in[2].src_reg) {
> +				snprintf(buf, len, "args[%d]", in->imm);
> +				return buf;
> +			}
> +		}
> +
> +		snprintf(buf, len, "args[?]");
> +		return buf;
> +	} else if (strcmp(fn, "dt_bvar_probedesc") == 0) {
> +		/*
> +		 * Access to probe(prov|mod|func|name);
> +		 *	lddw %r1, dctx
> +		 *	mov  %r2, N
> +		 *	call dt_bvar_probedesc
> +		 */
> +		in--;
> +		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2 &&
> +		    BPF_SRC(in->code) == BPF_K) {
> +			snprintf(buf, len, "%s",
> +				 dt_dis_varname_id(dp, in->imm,
> +						   DIFV_SCOPE_GLOBAL, addr));
> +			return buf;
> +		}
> +
> +		return NULL;
> +	} else if (strncmp(fn, "dt_bvar_", 8) == 0) {
> +		/* The variable name is in the function name.*/
> +		snprintf(buf, len, "%s", fn + 8);
>   		return buf;
>   	} else if (strcmp(fn, "dt_get_agg") == 0) {
>   		/*
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index a0205887..51c056b2 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -153,6 +153,8 @@ static const dt_ident_t _dtrace_globals[] = {
>   	&dt_idops_type, "uint64_t" },
>   { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "int" },
> +{ "execargs", DT_IDENT_SCALAR, 0, DIF_VAR_EXECARGS,
> +	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "string" },
>   { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
>   	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
>   { "exit", DT_IDENT_ACTFUNC, 0, DT_ACT_EXIT, DT_ATTR_STABCMN, DT_VERS_1_0,
> diff --git a/test/demo/builtin/ipl.d b/test/demo/builtin/ipl.d
> index ca7f3bb7..f613bb70 100644
> --- a/test/demo/builtin/ipl.d
> +++ b/test/demo/builtin/ipl.d
> @@ -1,3 +1,5 @@
> +/* @@xfail: dtv2: need ipl support */
> +
>   BEGIN {
>   	trace(ipl);
>   	exit(0);
> diff --git a/test/demo/builtin/vtimestamp.d b/test/demo/builtin/vtimestamp.d
> index 9f01bbf0..fcb708d0 100644
> --- a/test/demo/builtin/vtimestamp.d
> +++ b/test/demo/builtin/vtimestamp.d
> @@ -1,3 +1,5 @@
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>   BEGIN {
>   	trace(vtimestamp);
>   	exit(0);
> diff --git a/test/demo/io/iocpu.d b/test/demo/io/iocpu.d
> index c7b847e7..1230d6f6 100644
> --- a/test/demo/io/iocpu.d
> +++ b/test/demo/io/iocpu.d
> @@ -5,6 +5,8 @@
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>   #pragma D option quiet
>   
>   sched:::on-cpu
> diff --git a/test/unittest/buffering/tst.cputime.sh b/test/unittest/buffering/tst.cputime.sh
> index 6a420e8d..c0e248a6 100755
> --- a/test/unittest/buffering/tst.cputime.sh
> +++ b/test/unittest/buffering/tst.cputime.sh
> @@ -5,6 +5,7 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> +# @@xfail: dtv2: need vtimestamp support
>   # @@timeout: 12
>   
>   script()
> diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
> index b514dd99..a55fb6de 100644
> --- a/test/unittest/disasm/tst.ann-bvar.r
> +++ b/test/unittest/disasm/tst.ann-bvar.r
> @@ -1,34 +1,35 @@
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg0
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg1
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg2
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg3
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg4
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg5
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg6
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg7
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg8
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg9
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! args
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! caller
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! curcpu
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! curthread
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! epid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! errno
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! execname
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! gid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! id
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! ipl
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! pid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! ppid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! probefunc
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! probemod
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! probename
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! probeprov
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! stackdepth
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! tid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! timestamp
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! ucaller
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! uid
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! ustackdepth
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! vtimestamp
> -85 0 1 0000 ffffffff    call dt_get_bvar              ! walltimestamp
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg0
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg1
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg2
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg3
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg4
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg5
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg6
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg7
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg8
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg9
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
> +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
> +85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
> +85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
> +85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
> +85 0 1 0000 ffffffff    call dt_bvar_epid             ! epid
> +85 0 1 0000 ffffffff    call dt_bvar_errno            ! errno
> +85 0 1 0000 ffffffff    call dt_bvar_execname         ! execname
> +85 0 1 0000 ffffffff    call dt_bvar_gid              ! gid
> +85 0 1 0000 ffffffff    call dt_bvar_id               ! id
> +85 0 1 0000 ffffffff    call dt_bvar_pid              ! pid
> +85 0 1 0000 ffffffff    call dt_bvar_ppid             ! ppid
> +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probefunc
> +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probemod
> +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probename
> +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probeprov
> +85 0 1 0000 ffffffff    call dt_bvar_stackdepth       ! stackdepth
> +85 0 1 0000 ffffffff    call dt_bvar_tid              ! tid
> +85 0 1 0000 ffffffff    call dt_bvar_timestamp        ! timestamp
> +85 0 1 0000 ffffffff    call dt_bvar_ucaller          ! ucaller
> +85 0 1 0000 ffffffff    call dt_bvar_uid              ! uid
> +85 0 1 0000 ffffffff    call dt_bvar_ustackdepth      ! ustackdepth
> +85 0 1 0000 ffffffff    call dt_bvar_walltimestamp    ! walltimestamp
> diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
> index 6dc43424..61e838d1 100755
> --- a/test/unittest/disasm/tst.ann-bvar.sh
> +++ b/test/unittest/disasm/tst.ann-bvar.sh
> @@ -22,6 +22,9 @@ sdt:task::task_rename
>   	trace(arg8);
>   	trace(arg9);
>   	trace(args[0]);
> +	trace(args[1]);
> +	trace(args[2]);
> +	trace(args[3]);
>   	trace(caller);
>   	trace(curcpu);
>   	trace(curthread);
> @@ -30,7 +33,7 @@ sdt:task::task_rename
>   	trace(execname);
>   	trace(gid);
>   	trace(id);
> -	trace(ipl);
> +/*	trace(ipl); */
>   	trace(pid);
>   	trace(ppid);
>   	trace(probefunc);
> @@ -43,10 +46,10 @@ sdt:task::task_rename
>   	trace(ucaller);
>   	trace(uid);
>   	trace(ustackdepth);
> -	trace(vtimestamp);
> +/*	trace(vtimestamp); */
>   	trace(walltimestamp);
>   	exit(0);
>   }
> -' 2>&1 | gawk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
> +' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
>   
>   exit $?
> diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
> index 53e5f618..04fa3a8d 100644
> --- a/test/unittest/disasm/tst.vartab-bvar.r
> +++ b/test/unittest/disasm/tst.vartab-bvar.r
> @@ -2,8 +2,6 @@ NAME             OFFSET KND SCP FLAG TYPE
>   args                    arr glb r    any (unknown) by ref (size 0)
>   curthread               scl glb r    D type (pointer) (size 8)
>   timestamp               scl glb r    D type (integer) (size 8)
> -vtimestamp              scl glb r    D type (integer) (size 8)
> -ipl                     scl glb r    D type (integer) (size 4)
>   epid                    scl glb r    D type (integer) (size 8)
>   id                      scl glb r    D type (integer) (size 4)
>   arg0                    scl glb r    D type (integer) (size 8)
> diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
> index 098c1f45..ce489a24 100755
> --- a/test/unittest/disasm/tst.vartab-bvar.sh
> +++ b/test/unittest/disasm/tst.vartab-bvar.sh
> @@ -30,6 +30,9 @@ sdt:task::task_rename
>   	trace(arg8);
>   	trace(arg9);
>   	trace(args[0]);
> +	trace(args[1]);
> +	trace(args[2]);
> +	trace(args[3]);
>   	trace(caller);
>   	trace(curcpu);
>   	trace(curthread);
> @@ -38,7 +41,7 @@ sdt:task::task_rename
>   	trace(execname);
>   	trace(gid);
>   	trace(id);
> -	trace(ipl);
> +/*	trace(ipl); */
>   	trace(pid);
>   	trace(ppid);
>   	trace(probefunc);
> @@ -52,7 +55,7 @@ sdt:task::task_rename
>   	trace(uid);
>   	/* trace(uregs[0]); */ /* test this separately until uregs[0] works on all kernels */
>   	trace(ustackdepth);
> -	trace(vtimestamp);
> +/*	trace(vtimestamp); */
>   	trace(walltimestamp);
>   	exit(0);
>   }
