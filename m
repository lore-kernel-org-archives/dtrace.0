Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BD8248C
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594501; cv=fail; b=i1Us+RttGwVcUcGsRe9Pb9UWlwqfcXZ1WhPIDMLNyKDCfuEVXnvWuA3J0pH5cRJjpUGxdGkMrm5pMANvHUYaWL0HzrnoXq4VvoYaqaHYb1gm95O6QliGMmmrMOUzLjdxe7s5wiPm/49d5sz5nb+APke5nEOW7xErvHCgBJURFZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594501; c=relaxed/simple;
	bh=2uhwFU4Z0LOfDinm4Sn7nzHMEEO9fWqGNiABMsZCXqo=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HVrG4aa9Rw9xFExVGZ2i8XeCa9JPxGSO8H1MRw6ZbkKuea/Qo5JYgb0mDTkjIEgiYdX6z+AJLnqJw9K0x1MS42GaJ80lbuv1hr8OY93rqCA1gZgGt2v89EzDK8SQqxWwDy3pep/lI7ecYboCOrc9H5sfWnRtsT8OPxHtdeZ7rRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YvJKVzWY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pVosBm8u; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YvJKVzWY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pVosBm8u"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HEMhEP014372
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=P9FopeNSI9fEjuDNqFB0WMXnxoUPstxCx9Guxb205OQ=; b=
	YvJKVzWYLNzBqcCjwKMbnWk4B+LubmLuUpaF2WRKwNddqDtgMbHH1NAdViYrI00G
	7eQIdG7HZaa5qevYOZHeOIixXwLkQu3H0v4qR9fph51hj0dpBlpufgLKdRR/kqQT
	Vg5r7OjRAO27CBa2AFJIsVUoQNMJFtLPtFUf714NiuZ9ow/EzzSMada4enywk+r/
	NHFDsfg7o1+fWcunrwPcqpyD+jtqVaUUR9rOX7PzT6cAB8fdGL0B+dlI4EwuG04r
	AVqvgdusMHqDf+6dSPHBiNw9wcX4nba+0gdd/0sKKUAIwd7riEiUFT0h3tEDIBEx
	Bfh1SyXZUnW0O7V1PPPWyg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nsev59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:34:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48HGlnNE008921
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:34:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyfc7j59-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3RMNtovIKhXnLLA2JVmMqnNlPBVAbBG0kErOgjHI8dBBQDFJnJn6fP3vve4ph3C2X4TmUj6mYBleS0wxsbAH2YALKTEAU3/Stiz1mEbM+FZ2A4KNan1WTFQ6cah4lk656B4z47M9502Dk1VtBhiRlq7ykZ2pIcCbXifpJSsam6P7p5+NL0Lgev9b7C3DuDzHCjhrYqEAG3hWPJKwRUCH7AK0m5HZiKQs8hK/aFM/ZHNSi3sUE/MdqmreOyDNSkMGNgYaYOtMwR8Ns7yMwwkgdJgfqZc7bYw5HxuWvugYLtO+GUEnH6e17grA6E86cULNTmKkzf3Kp1yf74C3bRJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9FopeNSI9fEjuDNqFB0WMXnxoUPstxCx9Guxb205OQ=;
 b=SQo4QQD1hlaMGAMmx30TsazyglA8NumNLquZnmY0Ltsrb0wol6bZfOLKIqPZh5PBLkjcfbPSkTrkgyCzSiSfH5mlSJZiS/a5k4Fu+YXGiwjSs7YSKZzO1u61yL+Nwy7lfvPJ3KBM9/CflGvUMh0Y8YT+gdmhF5WrozE7u3UfSgBtClrHE4Uke06JJsQcKPM2V2jxkheErXx+2JTOgDBaoVEqKlF56rIYEbJ//8NFJVFDfGXCn6hMylF4SiYDtUkhX84hu4BX4lb40m7O4Oo9P271k8dgr9/iETyTTEdE7CjC4vdUPaLKVxC12VNhsvIyUPMakzw2WTepZZM3d9fxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9FopeNSI9fEjuDNqFB0WMXnxoUPstxCx9Guxb205OQ=;
 b=pVosBm8uNyh4wvEcBqu7AKOqejxLZgzP/BhWEgslWIXjymSa3yivEzejJ1bSmzcBTmWOm4xVMuWCOz/YJEcBzjC+RzMW5mjCsMcw9EyMDmHNMG1paMi90W5FNSZaLVvHhOgrItIxvKIUYeCsHdhtjfIr0jMxcZgrgXXlBzjfi30=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6097.namprd10.prod.outlook.com (2603:10b6:208:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 17:34:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 17:34:53 +0000
Message-ID: <649c9993-c8a2-4aac-8c38-35086d069993@oracle.com>
Date: Tue, 17 Sep 2024 13:34:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/19] Allow for USDT wildcards
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-6-eugene.loh@oracle.com>
In-Reply-To: <20240829052558.3525-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 28788a87-0062-48aa-7436-08dcd73f0a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTh1Q2l2Q28rSlhWMmdwK0txbjlZS2RWNHRmYXhqUlNSbTJ4bG5ybG9TWHdo?=
 =?utf-8?B?dTh6YldEVkhVZGY4SWMxNStaRm9SK1NyQ2lNTnhqMWZYQ1N3QnU0SjRyK0Ny?=
 =?utf-8?B?MEkrRlFPQXhSOG1xalNpZWo4OXRSWXZBdnlMU2FaTUJJdVhMK0s3dU5DRnJF?=
 =?utf-8?B?MzM0b0xZaFpGREw2b2lISVNjOWRVbW5JcWJlaWxoZUFJOVY1ZHdYUVF6NklJ?=
 =?utf-8?B?NTRucHBlWnNkYzJjQTZ4ckVSQnFZRllCbDh5clhNMjdOdkVtTUdlTXN3bFFC?=
 =?utf-8?B?K0NPQWg1QU1BTUwwRnNWNWQ2WDZjZ01sTXRJUTEreW54WFF1alNJYlpadFVp?=
 =?utf-8?B?ajhjNml5eWhCZ3R0K2ZDZUM5RTRoTmdDKzByYWlPS01Mc3B2YTgrRU1TTmdo?=
 =?utf-8?B?UTFMbzhONnBrUkFpeHhRRHBtSC9zTDRMOEw4N0laTTlRaURMKzhEb3JuOUQ2?=
 =?utf-8?B?UWNCQURqZURiNmsxS042eWNodFIybnc2Um1GY1BQalhVd25iNm41a2Y3VW1r?=
 =?utf-8?B?eXVzeUwzN0VEY0NkL0xORFlTa3BpaGZ1NnpUa2lpTFFPMTAyNHVZcG1jTGp5?=
 =?utf-8?B?ZHErWUFraEtjWUxVbUdIRmk4ODJXRm9qYzBMWVVYRDExSGQ5VkkyM0hkNjlT?=
 =?utf-8?B?eVJvNW5SWFhjZzNKQXBhNVJSNHUvQ29Jci80WFN6N1RWb3RHekxQKzhCc0Jn?=
 =?utf-8?B?R1o5SUJuaVdqRmV2R0lNK0o3SmhiR0VIc1F1cFg5bE0wd0oxcTBrMy92QjZl?=
 =?utf-8?B?UUFXSXhGUmZhcEFzbW1zYkJiOVZIblFUMnF6cmxEZmRYTGlvNnVJZ083UlRP?=
 =?utf-8?B?YlhrQ3lVaXBpd3NGaG5mc1hIbGJyKzF1c01ZNTBNeU1CdWRKbmJWMWRXeXY1?=
 =?utf-8?B?Q01vRjljNy9KL251YWtYcjhnL3luMExJSlovb0NwaFNISkdJMytsSWJJbGEy?=
 =?utf-8?B?bzJSbzVTTVlUbzVUN0NQdHVKeExWc0VIOUUwQ3NEVnlteXNWSHR2dktKbmhS?=
 =?utf-8?B?SjR6bU9aN01WTDNEbGw2YXE2V25hbFNNOFJNSVluVUNSRTFXWW9qRUFSMEti?=
 =?utf-8?B?eDloUzQzVDhOSDRqZUJOZjkyVmo4RDFQeDdacWJwVklsL2RLYityUlNKcGZa?=
 =?utf-8?B?VmRQKzJwdWRkT2JFRWRwcU5BU0tQMXFmdnFFUVV4VnVqQ2FrSHdseDZFYS84?=
 =?utf-8?B?Mk0zdkFVV3Jkb3NpQllsNmxOQUp3RWVldkZYT0JRZFlvNVl2c2ZuTWw3WVp6?=
 =?utf-8?B?bXU1ci9YYlRSNXBqbmo0bzZKdW40cEloOXVVMzlHVXZyb3BlMkw5dDdlajZV?=
 =?utf-8?B?bzNrc2h6dTNIbktpaWVnK3l1eGdzMWMzcW11alhsSHRRT1llSHM5RWNUcDdV?=
 =?utf-8?B?d2xycld4aE9pK1hlSXF3SHdVc0ROYjdUNnludjBuMFFXWlVzYUdwNExWRnV4?=
 =?utf-8?B?akxnNmp4T2JCM1VyUHNiWTMzZU95ZHFlUHVDN3ZKNVVJQkNrNFZyc1YvR0pE?=
 =?utf-8?B?cVlnbkFaYTRESUg2NkN4TjRYa05pYVFwYTlZamNGNm1DYnBBaTFHa1VTT3hT?=
 =?utf-8?B?T3R5eGNhM0NZeUlNUC96RlNRTnRRM08rUWVha1F2VTdqWWhnNUxzdEJyQ25T?=
 =?utf-8?B?N2RtS1RRd1hIWjVLbXRrSmQ2VzBCV0xtTlBoYUhvZzU1OEtlS293UUoxL2pK?=
 =?utf-8?B?OENVUUNXQWkxQ2NBaHlBbTFYMDhzMmZVNWVNN2lhRDVLNG5lOGc4OWpiaGJ4?=
 =?utf-8?B?blo4R3NxYXVYUmdPUER4dXIwTmhuNWh6eVNvZS9WeWRGVDRxZGFuazhzbXZh?=
 =?utf-8?B?RTVUK0dXS0pHYWowR3V0UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVg0OGYzWmRPai9LQnYvV3l2MGsxaDkzQWFVYmZKRkQzSENXeWdoQWhCWWpI?=
 =?utf-8?B?RjIvMnRsRUdDR2dzOVJqem9QSjlxTldlWFNhWlorMzlpZy91em8vYUV1Z25V?=
 =?utf-8?B?bHIwZ2JYRW1MeUlXMGI0RTh6ZE9JQkpOMUI0NDNEbVhmMFpsUDVJWXpKRlY1?=
 =?utf-8?B?WmEydTQvcjBuY3FEYTR1cy9OclFTOEhZaC9QS0E3Sm0vWkpzd1ZyQVUvNWxH?=
 =?utf-8?B?UjdQMDliL1lBYW5xc3YrVkUzZXlyRitMMjBNK2RsRkRaWDNaREFXeTVlOWgv?=
 =?utf-8?B?WENkZjhpQ1NyaHA1MzNnL0F6YVBZdFFyeWlsZTA5VitNZHZOd1RyMU02d0Vj?=
 =?utf-8?B?eVc1MzErK0owMzFzQmxVayttMjhNNERCWXFELzNobzBROWxIRm5MVVNiU251?=
 =?utf-8?B?RXRTOUZ1cXdSWmZaTW1iQzNmMWliaEhtdUJBQk1TTVhaT2VrVlRCWUdxbVVj?=
 =?utf-8?B?ZUJ5RTlkVWh5dzJuTjdDSCs1TFR6ZUk1eTE3aUxYV1BzejB1NVdON1JZUWl3?=
 =?utf-8?B?Rm03dWJFT0xBRXlycm5uMnAwcU5IU0FFZ09UTzF3WFhKTXp1VmNPNEtuRE5x?=
 =?utf-8?B?WUplR0pmcjNxQkZ5MlEzTE8yOGRDL0RUYlI2cHliQUNaN1NsN2xyajQ0amtP?=
 =?utf-8?B?N0VCUVplWHoybldLWVo3YW5YMmk1R3ZlUFhiRFNlNmhHUFZ2WVRJcTcrK1k1?=
 =?utf-8?B?cjFwcnpuTmVGVU9QZHJPbjZnRTZpVXFoVlBYSDV0eFlsdGZFNlJCSUE2TFRl?=
 =?utf-8?B?QjV5Nmc2VS9aMW81UlNPeUlxb3ZqU0RGVjNiSGR6TE5rYUVpM29WZDd2aDNE?=
 =?utf-8?B?TXlybUpXNGxEVXFWc1F2T0J5T1M0S3FIYlpjci8zSE1uZ3FmRkptSlV1MXM3?=
 =?utf-8?B?S3cvcUg0Q1pFY0lXa0N5ZUFHZEUyMTFmeVBaL2t6TUdpL3pQVG02RzFFMnVC?=
 =?utf-8?B?WmJaMy81UHIvS2dkTU5idmhUb2xpZ1FtRTZIOFRwUFVKdGt0SmFNVHBUL1NI?=
 =?utf-8?B?TjJ3dDlBUlpFOStrNzdtVTFIbklUbVlTMzRXN1ZBbzhiYmI4Ny8rWURaTm9p?=
 =?utf-8?B?SWhqZnFmQmRENnk5S2l0SGVkUWEyU2YwVnV4UVIyK0lCYzhDMzUwRUtac2J5?=
 =?utf-8?B?Mk15TWxRMzYyclFnT3l6ZFNOZ0s3elFyQURJd3hpVkNld2VNaW5Qajh6dy9a?=
 =?utf-8?B?VWozT0NmR1VXRE9MMDVGa3pPdURhalpPOWo4QkZ1UmNuNUhCamlxQkpnZzBu?=
 =?utf-8?B?UFZCNVBBYjM0OTBWdWw0T0F0QWcwc05BMVF0YmovZXNkTkdUV0k2QWFMKzZ3?=
 =?utf-8?B?elRJWG41UURydENSUWdxRjEyNmpXSFV5Ym0yNXhUcWZFamZNUzd0a3ZtL2Y4?=
 =?utf-8?B?QThibk4wVEtLeEtiY3RaMzBMdmIzQ0QzR0xpeEFEci9Kd0hqZFJMV3c5SWRK?=
 =?utf-8?B?ZUprMmpVZXVwd1lEaW1BeGV6cnRNR0Z4UjhGMWVSNTRsdzhyMWNQZm56SjBT?=
 =?utf-8?B?bFFFNy9JUi9RcWQ5T29jQmN0Z1dlQit5bE9CcGZXa1B5MnpIdVQvQVNQbVFO?=
 =?utf-8?B?b0doZzhMOWZYWEYwWWhSeEZabEUxSmdOeTJSQ01sQVA0Nk4xM2ZXL2NpakhY?=
 =?utf-8?B?clVTNTZYVm9sd3VHZklKaS9WWUJ1Nyt5dzJLY0hoLyt4VnM4eFUxaGw1TlRa?=
 =?utf-8?B?SFNQUk1VWVcyVlgrLzVmSnAveDFiQVdUSSt0WFBROFEyZWZpVDFZcmlmMTJC?=
 =?utf-8?B?b0hsSUJENkgvVDNDeXFiUm1MamhJQSsvMnZ1L1RveXlTVVR4ZVQwbDEvT0F4?=
 =?utf-8?B?NWowSE9qTnR5RVJtTEwxWDRDcFArdG0xbVU4dlZzbEZ4WVNyV3BNVjdBYyth?=
 =?utf-8?B?WHN6UXUrQ1JHd3RzbUpoYnp6SUUzdEFHL050YTMxRjhJb2kzaEpsNXNYRkdX?=
 =?utf-8?B?c3pod2RlYzE5VWxoWnJ0Vk5mUW9Cd29rTFY3QXVQVHltMzc5L0M0L00wNVk5?=
 =?utf-8?B?ZHB0NWJISU5OQ2FBZjZESEhIWGVhQk02L2Uvb3hHWW41THBjdW1weFpmQlNN?=
 =?utf-8?B?RjdrTkZ4dkV3WlY3aGFOTVgzNzVxNWQrdUlDazFQOSs4b1RPS3ZpZUwvMHRy?=
 =?utf-8?Q?AVOiNJZ49NG4pLK6EpzlhUfjy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tw+eIzgtmSWDTgtt9hWG8mu2HbSUnmXFEyKjL6jcbspkTBZwmAjEmX5LxgcdHJWAirzNh0Hp8rJYIDayB9qo4+H4100sOcjEkLtWbsR5tx+UO5OWyLLzc4HqxLQWNqZO3Z1SAxOXlX1xC6GxaFVUnNRGWnA2MLqrWTJcKQDw3WxPqcl59NKiXR38ty9ADXN/MInEiETXk9aJiHIuLtvq6Eod15RKZpFg6OZ1mkYyZfpaX3vXSxNwvnPuVx358Kci9GyuVJAG7L/h+N8hA3EQfHfP8Q4k4NEU9Qdh/a0BO4RR5qQulTjTHVc+f26hMgTULTJrcZraB+GANXymgCqcnHCbysuzv2EESBc3EN5FLjbXlc+qQJV0/SJdHQbObdjrnrOw+r4RXVFU16x5WRL174dGoKE9HvHKo9zpf+DL8+6N+FOoy4k3ppXmiVou3/RH1n0gD/15chsX+SgtWiD1IYyX5/tFvPbnhT6gKAhpWaqEhPydua+iooBkGLOVxXsh8g+f41VwPwKBytpoP3WDoK3fCCiODdM3RCImhzBoCUlRBntox/EBfTH19WA0eEr6Z44kjPnzW7DIz/jXCFDei3bvh5wx6e174PpuNExKgqs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28788a87-0062-48aa-7436-08dcd73f0a34
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 17:34:53.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtsJtZdaAydBkioEW+Y3/uJtkoJyWUBeWd2YwwHC3M+QCozLG3DxUbVCastjdDtd1AVRq8hAhyzNaWK50aJxaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_08,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409170124
X-Proofpoint-GUID: 4NfC1oRn_NChoxCnCYSnJbMygUFnb7e5
X-Proofpoint-ORIG-GUID: 4NfC1oRn_NChoxCnCYSnJbMygUFnb7e5

This patch should really be part of a later patch (11/19 "Support USDT 
wildcard provider descriptions").  When the two changes are separated, 
the intervening patches are broken.

I'm withdrawing this patch, squashing it instead into the later 11/19 
patch.  I'll post a new version of that 11/19 patch.

On 8/29/24 01:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> To look for pid probes, we can require that the provider description
> should end in a digit.  For USDT probes, however, there can be wildcard
> descriptions.  This includes a blank provider description as well as
> a description that ends in an '*'.
>
> So expand the criteria appropriately.
> ---
>   libdtrace/dt_cc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index cfd4d3d1..a9934d10 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -278,8 +278,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>   	 * On an error, dt_pid_create_probes() will set the error message
>   	 * and tag -- we just have to longjmp() out of here.
>   	 */
> -	if (pdp->prv && pdp->prv[0] &&
> -	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
> +	if (pdp->prv &&
> +	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
> +	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
>   	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>   	     pvp->pv_flags & DT_PROVIDER_PID) &&
>   	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb, 0) != 0) {
