Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC02FCE07
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770248; cv=fail; b=u18KifXjOvBBQmtnXpjn+G8F/MF6TQ0v3r33cVdvvxzqbbSAXFvvthbXvaLQeGeMdkzNAhPi9Rt3T9Fa2X1E0u6Vgh9vosBf/PU7Hd+Bt1mlcYNP4iW5txHYJTXP29WArSm0JWSEMRN72IqpDUdOS7Q9Vya56HlPpfobmuYaYps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770248; c=relaxed/simple;
	bh=rv2O8hNnfBVzh7MNvlTfZA5sME4KQMK2EY/hQRdKKss=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iDAqhujRweBhYmP+2Amlps2eGUVxhGQMFkX72hqWUtUdvQUI62nWdSnAKmHCFXlt6y4wa2aOfnPT6DQ+bJ4A/l1/yO++iHfQksZmHDXrgYdKfVoQNq8lD2SL9hfIlkzB1nN+bO8hFRE0tiLeiQOa/UZ7KHTibxZRBGGV6JtYCBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X3tpY9JP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CUffaq2x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X3tpY9JP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CUffaq2x"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HGC6ig018971
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 16:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vLukjyZyVfD1DXm/SwoCZUtZCJU3m7nX1CF9h9zGmCE=; b=
	X3tpY9JP4uN8SrQ2AhYNXdbbR0GCMT3QqoGN4/Lurp9amcz+kGidy5rLTnECrvWr
	qz9eJqBuc3PmhOB0zUuKSg3hC93pQmSWjBW4GHBokeGK2MVe98ODv/09yIAAh/TJ
	9D3Nv+LTFzTliuufv63AEHG/E/8TYKb+ZbaPVcMYVaSjGCOg+yP/VgsnZ/EQ5byw
	G9oXlfZWdQ8woKrl8Ot0TX/WF6CFYl5cDp7HRZjbJLhCElegn91SI+UX4jUngcVM
	TdU6OtS4sQ8gRRi2mGq68Jg+ooS0n/JRd8YsZFeaOmLGknDPjfy1hph//Zx0OKyl
	+e8p+y7hJ0sexi/QE8s5Qw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqvax6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 16:37:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56HGN60s029669
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 16:37:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5cp1k0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 16:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrUyu9tXVH2C4PTUTJXlh6PXr1dUeTA53Yb9j/W1q071i2y0qFmYPhd0IM24asm7T/3Ky8LJYZR0C2RtcBwgtByzohz8GoNaRH5wVC20JFHW9dZoCtNNPbb7mkXPk+665jpRtsnG1M3zh+mX3yV8GTRJtFkyGf59gHMRHt1Jl+Gn04SadPJ0PRtm/TJSpqJD1p9xvG6X3/juC9SJ3OUaT6uGbpVQFGuyANCCYrru0vOez4IPBcIfW4lpdM/7YeufDq4WC5YkXVZZbA3ihNDPjjGpXxoHYdhTp6a5JYX8JKEk8CkllacEEc48E34Nkx7lFCCSHLSSisKAB4E9d15Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLukjyZyVfD1DXm/SwoCZUtZCJU3m7nX1CF9h9zGmCE=;
 b=qGg/xww8PMbj0QIodufSG00tF9ljiLkrkvqZgBZAyoomZrVxKGbFDcleLK4fSy6Va0KuVjfZp+jlCluvbT3xNVb/jP0d5kM8UfXvHbs1l6fV5hVcjOZgYfpcXDqMYNO8B188qL8ASMSYH0r1i3aDnkBoPJFE5aXAJuEW+s3sRQJIOb9lBZnmmZDLLrk49rpKQ7U50+hiv7BFAtNbwygIWdX/AuCj6XexZUjuITLi3Q/JKjMqZYhYyKNFNLMHMc0VUqSRJF85EwvW3kb3wyib4cA0MGgj0Hz1rM7MlP0JW1g1hgfT25uR9voxWP1hnRbwbYKpJJNuw3+nNQkJX16gjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLukjyZyVfD1DXm/SwoCZUtZCJU3m7nX1CF9h9zGmCE=;
 b=CUffaq2xD4a4U/ZjyTwzh5HqmYKyFoOEKaAmezmZmyBybjBwS8A4WXuikvK05hIxwyP06WTllgaCvKN+xcA+KP9lttxgKqXctTx6p3G9AkmOfZ/QlZCbw7bkp10xao8et22NrQlZxVkGKwHPl9YRck26IBofmH7EIOHZ4k66Xds=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH8PR10MB6340.namprd10.prod.outlook.com (2603:10b6:510:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 16:37:22 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 16:37:22 +0000
Message-ID: <f7a6a3e5-0c05-0b9c-d46b-1982b67e16fd@oracle.com>
Date: Thu, 17 Jul 2025 12:37:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <87y0spsosn.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87y0spsosn.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH8PR10MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 784a65ee-6b19-4a9d-91f3-08ddc5503427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3NwcmdYZHhTaFhhTURzT0I3T1ZmcEM5TVN5RE9WNmdOcTNQa1QzcnZRUnJ0?=
 =?utf-8?B?bjFBeWVKY1RpTnJMSHlJcktHZEUzTEttTHAwSnFoTXhXUGVMSE1vc2hOZHph?=
 =?utf-8?B?YitIVDhhNTI1WFgwUWlzb3ZmU2Z3am00UG95SDA1elZMV2p5ZG9TT2dKTkpR?=
 =?utf-8?B?RUtCT0UxUDZyVkVVSmlUOVBqcDlkcVpZR2htV0FRL0IwcEgzUDhIcUlteEVK?=
 =?utf-8?B?VG9uS0sydUFCWFhpZVBQT2grOUR2UFd0SFRzTklLYStiS1BWSEVxcXBzTVdN?=
 =?utf-8?B?NVk3ekpaOHBvQmNRVElOQThUTFBzVmJzTndLVVI5cU8yVDR3NitBZUNXSWFX?=
 =?utf-8?B?MmlaTFZNZy9BL3lOejZDOXk1NVRiRjJORW5TVHMrWkh1NjA0dzFvbHdPRWF6?=
 =?utf-8?B?SW1FaE51QWZlR1JydTN5bWtYTjNtVjZweG4xZWUvUVM5QzlnbUJXOXNrS2Ny?=
 =?utf-8?B?U0E3L1FRU2xIbUs3QXdQdXNBcmkwZWJlR09zMEVaK0liUGM5ZTR3WGxzRkhR?=
 =?utf-8?B?cGN2L01aek4zM0NOemwvTVR3Y1MvelpEb3FwbG5iYlRWSlB1VmFpYmYrVWF6?=
 =?utf-8?B?bVlFNGJhdWhJVEhpTnEwR2paWVZhUlJKZnVQRmFiKzMxdTl4WGgzK3laTlBs?=
 =?utf-8?B?Mk1HQUtqc2dabUNXNnhZOWJIRWsrUG8xTGtaQVphOU05aEFwYnBsbnkvQnR3?=
 =?utf-8?B?YzJVL0VmVklKbkNCY1RkUlRLYVdRdTFrLzl2Ri9WVHZmRndjWXI3WFg2NlNn?=
 =?utf-8?B?YytVcXRNaDlNb1dnbWtjYTF5VDEvNjY5UThxZWV0OUlwVmd5KzJYTEpubjVH?=
 =?utf-8?B?NHJpVExEc3NlUkdHbXEvY3U3QTR2VUtZSWFQUktPaThmalBkcXlWQ2dKR2FF?=
 =?utf-8?B?UjFoVHVmelJzbTJDMUlJSHRzb0JqeE1TdlorMWNUa1lVcFhEZ3VTRXFXcmkv?=
 =?utf-8?B?enlCWTJMdGt4ZndMVkVlREpOVHYvc0tEVUVIRHdTdUFReDBGdGQ0cmsxY1JZ?=
 =?utf-8?B?SmNEVFNPaHhIZ3JuRmdNcmwweEdmZ3hUdU81Nk1NTURnL2JPZTdSTnZ0aXlj?=
 =?utf-8?B?NE1yTlIyWXQ4NHBhOCs5OHdNUEhFNUZzQkQwam55dHpjdjV1REhTc1lBZzhY?=
 =?utf-8?B?aTNjaHB2bWRXS296MHh3MjkvaFEwSFZBSXdCVmtjWTB6MXVGenNuUHdhOGZB?=
 =?utf-8?B?YzdnOXNiNGozUlNYNHZFM01KUlliMlE1TjFyUnhHQ3VBeUpqSGVvUGpFdlJa?=
 =?utf-8?B?a1ZyU0xLK1UzWDhDbkVabW4zTFAyV1VLaDVEZElZRk05R1BKalBUUlNGU00v?=
 =?utf-8?B?QUdmdklNWlppZHlhM3FNaWhleWdNbnZ2REJEWll1UnBxaFhxT0YyUWp3MzFh?=
 =?utf-8?B?c0hYaFVMc1dQdmFETUVBYU9KUjBWYkVvVDIybkpUWkRHdE9HYWRxTGpGNTNn?=
 =?utf-8?B?VW0xa3FNVDR1VFlrdmtvVW5RRGg1ZlZucVhodGFROHlqNnJMNythQTFMY2kw?=
 =?utf-8?B?anlsbnhDcmppcUs2dlBLUVYxb3pLaE8wTXM4eXV5TStkdC9FcVIwK1pLdm5T?=
 =?utf-8?B?VU1ZN1FZbXo3VERKT0duYXNXNE9rdDZUVk5VM3dvdmo2TlNnVXUvR2RRVFBK?=
 =?utf-8?B?TTN2ZzVjazk4UG9JRzNZbDBzV2dKTVBSVVMrazRjMWJHNG4xZW1wM1o1VUg1?=
 =?utf-8?B?cndRYmVkQUtLcVBxUDBWM245cmhudkxlU2lGQmtSeVdia1JqdUdvY2Ftd3ZD?=
 =?utf-8?B?Zmd5QnhFT3NXb2hZK2lROVE2UFBWSk43TllnQk5Ybm1EWnd6U29BVlVEcWlL?=
 =?utf-8?B?a09xVmxWdVZzNnNiYmFJVnZhQTZNVDYyVFNMVzFjMlRpS0paUkl2cytWYSti?=
 =?utf-8?B?RElEZ1gzR3Uvc0MrZ0Q4Q0Q0S2trZ1hTUG0vbzJFYm9SL2cvRkdpWFRUOGVQ?=
 =?utf-8?Q?GnzJ4C4Ir08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERtcWdWeUJPV21IT1lKU1M0cVdHL2dEdjZtc2ZYK09LajEzUVFtdWlVZVdI?=
 =?utf-8?B?OGlQRlYzbEdwQjBVbDNOc2F0WDlOTkJldldhUEtrRTQxNy93TlNaZ3RwQW9I?=
 =?utf-8?B?KzVqa0VQc2RsNnJ0OGd6VE93RFhwTkpwV3dFbHZodDMwU1g1MEFraG0wc09r?=
 =?utf-8?B?ZmhQSTVnaXRDM3RkOGlyZjk5VVYvYldzNEpCWGdCaGRWU2RjSENBQSsyRWd3?=
 =?utf-8?B?ck1RcndzWG1qaTh6Unc2bTdKMTdKellyQTdYV05rUGg5SUpnNkpMbjl6NGND?=
 =?utf-8?B?NmNWSmxtZ2FGdWMwZnF3VVJMMTg2NzRtNlU0ek42UVZCdlNFTG51N1VhelJp?=
 =?utf-8?B?RnRyYWphY0dyYXRyQTZDSHg4TE9JQ2RsRCtsMUhjbWdiS3paZy9NQVY1WUtv?=
 =?utf-8?B?QWtuSFIwdytJTlI0MCtaZWhPRUFVNzJVRVFkQXI0dkN6MkQxcHhhT0dBZ0pn?=
 =?utf-8?B?ei9jNXIvajZnYjR0Um5DRHI4eExGQjB5Zys3aVpjWHlZbURrdlJUUkFMTjZ2?=
 =?utf-8?B?QzFQdmwydWpRYnJWemFhYlFOWjFQdnlnVk8wQ0pwMHBGMHJWU2g0cmxvSmZG?=
 =?utf-8?B?L2hKRmM0WmEyY0ZCSWZtdU1va1JaaTYyenB1NWlLTWl3dFZpTW0xQlVXczk2?=
 =?utf-8?B?Qm1sSnVHamR0K1l1L3pJeFd0eTI3RXArMGh3bmZSSWp0KzlvNWFpVXBzckhF?=
 =?utf-8?B?cUtRdjNoaGFTRUt2SzB5NDBjcGNrWGF6bjBVZXIzc2FlNkYyd1Jvek1QR2xr?=
 =?utf-8?B?RnRoTzZVOVhWZkJaQW1WZkQ0U0p5SWhiTEh5eTIwekpwM3NpcFpQd3BQeVJV?=
 =?utf-8?B?NEJjUXlNakJ5Z0xwSEhpL2kzQW5sYWE0bzNNR2hDSndqeUl0c0xZdHRBSlBm?=
 =?utf-8?B?WnlwS3dGVjBpczdMdzl0eHVEVjFrTSthM0h3bmpXTnZCZS81WmwyKzdhNUd0?=
 =?utf-8?B?emlVZ1FnN21BTXhDSG1Vb2kvVW0yWEovT0RLeWd5THJlUzFoZGtZbXRoNmpK?=
 =?utf-8?B?TTloR09OVkRzblZGakY3VWErK3piZ0hSQVNZa0IzbExUUklydmY4WGtZRksx?=
 =?utf-8?B?Qk4vRE9tK1hKbG9lY0c1NzB2ZUlIdlR4Z2Z5bHBZQTFaNU5mSkFQQlZ4TWZt?=
 =?utf-8?B?cmowbHJuZzJTUXl0YVdpcGVzY2JLbU9TL2daNEEzK2NwUnVOMzg5eGV6VHI1?=
 =?utf-8?B?TjNOejdQK0hFTXVOODdpYkxNWlBGd1FtcWIyR2t5RUhNWmp2RkVuMWJ3blBL?=
 =?utf-8?B?YzJ1NWVVLzE5TTdydm50TnlFejBIS2ZPd1FlN0kzNGI5bTN2aFFFV3liN1ps?=
 =?utf-8?B?TVdNTDUvb3FDRG5RSlNYYVdsMThlMU1Rc3YyUGc3Qk1hTHpJMGNSbi85MVpu?=
 =?utf-8?B?MmRwNy9JWitudThGWVIvSGI0Qko4N3FlQ1p3OU02eWM5YlJFUGljWGY2eHR5?=
 =?utf-8?B?RmtDOGU3T0dWeWdGSWRRSEt5bG8rQm9EQXJVcE13TmJrcE9ZQkRORDZpM1k3?=
 =?utf-8?B?SHQ5SlFoek1BaHlOOG1kekthQmlrR0dWZytSVnBaNkRmZEZQTU85aHh3MmRL?=
 =?utf-8?B?OSttN0hxYXltVFFIbnp5M21FLzdydi9hdElXK3VDbnNzZjdTTkpTMVlvQ0Fk?=
 =?utf-8?B?YnBoNUtSU2FzVjNlYmdtZnFLajZkbXpVNkYxMTk3MnJ5RDdNMDlrQlNVaCtr?=
 =?utf-8?B?UVJ5eUw1QjQycnlMaE8yV05KWU9STHNaTkFSMnZUd09OTDRKY2VHVnZjUUhn?=
 =?utf-8?B?UmU3SzFISTZIMWZmOWI0NlhmU2Q1bWtnNTRVTGUwT0Z3b1F0b0hKN1lwb0ZE?=
 =?utf-8?B?eTJwN0lnYldxUWRPRGdDUjRlWjR0czZxNy9XbVBpNkZzcnozQit5eTQvdER5?=
 =?utf-8?B?a0kzYkJ2NHBZTFpuRElMOENMdk5iOVlSWXFpWVRJUDMrancwVElZWjlRc0VK?=
 =?utf-8?B?cUhJcnZKc3dDeE1RejVSd3o2TFZrU0pOZkdhMkxqeitQcUhmemF0WURaWllD?=
 =?utf-8?B?M0E1M3JQYW5ueC9aVVZVNzgvWDBPNVBGTUMxTDB3N1ZKR2toU2xFekJMU3JR?=
 =?utf-8?B?NmRRVHZQaUJQbG53L3Z3RVo4NWJicjBmZVNCcGlyYlBTZHVmcG5KMFZ1Uk8w?=
 =?utf-8?Q?Lb81Tw5L/UBhVPVc/eNbB+lPN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DRGQh1iSz+6VH/oVsjs3A5YrMNvlVMRl7p0imsr0ol/NbikRXifP8qncPfbuJZQQjSqEEvGT6nKRZMyyZ0S9QhmjiCAAMQ4E2hQrpsbqmZiF/OdF/zk8iwG64887qzRh8gkYGgDPvmYSuqTKUy0+3LuYhIpwlBVVixeakNS3Ys8FolAy2VwZDFHpT8+Yb2fOphkCYnNRFOAxHAJboSgltTIspW90m5WDcvdKfXzHI/QP1pg+IyCIhvuq4QxdOdRCrQGovdSeSKHZsfpWmj6X0wkVbY91RFSrNhQVi4PF0+uTV4qfClzVvsmYVtpLUQaV9rEvTmDSEOSHh0wh0DtH2TvwI0Ox8iJFY/eGLSq5SawFSFmBLqJI3RMyihe/kuGnt4J5GPIPX+NxbqAYl8o5Zl5pkZf4pBMCOpOSCHH8pqDl9O+bgx3FLVOrFptP0aH15SYG6p7d4WSLOVgK2cLiF0CDzh6FULh5WwSX+83l/aPvE+ijyJj56uq84oyR9B5AnSEPMdvzGDvLdNEgUCGvkXAsRu2f8FSr+bl0tge8kWAEnjGTFklGgUSJBt7OcO7OMN+1Z4iFr1IhqRVaBITXZLB2Blv8A2DabFWNkjnZB4M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784a65ee-6b19-4a9d-91f3-08ddc5503427
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 16:37:22.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5igdtb839/ZrxUyRPz/v5IrZ8DYIZX+KwzfgtF2bQ65Mc86+k++NZ1V79MhF7taS6UyyX7/NbouszNw8N2v/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6340
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170146
X-Proofpoint-GUID: mrug8NPaN6GeJnf0c3_hBP3pOA6ie1Q7
X-Proofpoint-ORIG-GUID: mrug8NPaN6GeJnf0c3_hBP3pOA6ie1Q7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE0NiBTYWx0ZWRfX4gOiAtcS18bq SFZ3VW8aB1B16huvPnqWJ1vsHn0xBzQM51rnTTVTRSWuyOE49cQQvwspJc513KdTedYH5ogt25w ugAzPWnVYaeCsOWCHUReCRkUUUsuF9hWceDtnqrEGcA49T5iZRrnVHV5XimIX2OZR7swD7h6zVx
 5GWs+qos/gJpDsQbs5uddcWqUHVvMdfHwdey/i4djrr3zNXuteMZR/tcFY7NyJYFpkpAvmxrpES sP0BfGpHIbUGVSy63HtVctP8T+pvvu4I37GHpnbL4Kzfgsrt7CdiAjGMBtUCqbW/m+f1pkx1izR hUXrI1PWiZCaBxG6YR2N6n65ExYL9WEtrU/tBx1jKMK5VgUVqdl6XidKjqrKz5LPOc0X6NKXNkC
 N52RDYp6dCyr74hsnImAHgoA18Y5t6DNY+rZThSsDv23E1j/PENbl7Mpjph//PGp4t8ALmv/
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=687926c6 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=To1BSGsURhMh2uAKM10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 7/15/25 06:59, Nick Alcock wrote:

> On 11 Jul 2025, eugene loh uttered the following:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> If a clause includes a destructive action but -w is not used, dtrace
>> should not start up, even if the clause is ignored (due to -Z).
>> Solaris treated this as a runtime error.  We should do the same.
>>
>> The test err.Z_no-w.sh was misguided and is replaced by a more
>> direct test.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
> modulo one microscopic annoyance (I am not a real unix programmer, I
> don't like creat() and think we shouldn't add more).

Sorry, I don't know what you're asking for here.

>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> @@ -1304,6 +1313,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>>   
>>   		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
>>   
>> +		/*
>> +		 * This check should never fail since, if any action is
> Grammar:
>
> This check should never fail, since if any action is

I think I see what you're saying:  separate the two phrases with a 
comma.  But there is a big appositional phrase in there ("if any action 
is destructive and -w is not set") and I wanted to set it off with the 
commas.  Maybe I'm wrong.  Dunno.

>> +		 * destructive and -w is not set, we should already have
>> +		 * failed.
>> +		 */
> (but worth keeping anyway, I agree.)
