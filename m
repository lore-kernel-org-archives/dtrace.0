Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA6145A0E
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722547828; cv=fail; b=dMit18nTFYwCks3i77NO4cidYs9Ieeaoa7bg/hsMTAHvnDqP7+HRCLBLpV/Le4LjQ8RAEVaLoPhx8Q6CygW9PslSY+ZKWfQpV9ImwfWuJ7AdU4ngBHzFGkylAcUiBilglXhXaptBv+fjpUnA5/HYGHDk+Poza6zN5vv3mRH+hMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722547828; c=relaxed/simple;
	bh=F/UdCU2lIpCZ9iKMBROPrfKkfdndWr4a9aJbIbN7jtY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sh9R3zwBK4IHnLESWgmffWvhSnVX5gHkDBGQ8e4MHckm1LF2fP9hiVEZ8edW+WtMciufZ/LAnfRH2Y6htCC0phq8lB70otkmex6Ea1OSo2pdQW/5GrX+NRwYTrpZyk9AQYVRdQNyW/xSVV6Lf89CDptOsXhlBGaycpEG4sxFyRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CcD0/3qt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gX3v3U3R; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CcD0/3qt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gX3v3U3R"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471L66Gp028393
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=uEKctXN9SRKWsvXn9dnUlhoAihC2m52wgTUClgjFqkg=; b=
	CcD0/3qt4PxnHlUihm2AsAArbbtyzolFWYjteuEOQNkwuXqXpfTGXHySmvH/kLWW
	1u6HELiCJYiM5QeWqAggt9yBHfErcCUHe5O8Q55QPYf07N1J+pzrnRwrxL+isWk+
	IZYo4XGFPa0Lr5geKc1KuOjFBXCYucqKvdsqMlNG5Ct4ikf9VyZRgWgzjaDKAxmu
	I43pobMTbRNWwZ/La2MM4dLLymslmT1H9PNfpFeoZSmBOvzGH4mwf3aO5QyBC3+b
	evQQ9v95/yJB/UWP7JzSS461rn+TScEYM5h7zKY82474oZaaYeTlYuGfa21SIw1B
	Sn0JyHUI8nQr0QZHxNMFJQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqtatud2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:30:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471Jxjd7019052
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:30:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmu7c0s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK7sE8RySJoxa0mk6yN2tP+ONRPt3lrvneMCgYxXaO3hL9pV9dXcXVU41ASsMkMXtfP6X8IqZLm7YlgO7BsCr2JqhypmnCRbCiEuIIjouesj0H5loGr6bfGNsftxpb0oaY1roPGXjVNa3YtWA/IyplOH1648gxGQAjgOkWDUkYJMCXiuPX8TtfyCo8nLfTVXKHqO7SsprooTmHUG+c3zJSJp6VwYYhYY+UwfjG60yhtY9PrnNYJag+FwiCvZNtgA+2cyyOdEkIX1FFVWVH82/BZnt/JTZ7c2/K3oeRpzaNVSKnwSzCRJggLa+yV1WB/yeOn0GQtbrhrxfn+u2cTMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEKctXN9SRKWsvXn9dnUlhoAihC2m52wgTUClgjFqkg=;
 b=xGZyJJxLGE4XHP5teEbKluYD15u14bG2b4XIULI8ulnv3mPEcR8GAsQMI7wvRbdbzkPD1xhcbqxcZ0zta6ItVF04lT2N+jz9cgG9M+Cuw85KGWgsPPmGQ8L8gTtOsSWMfd9gJ/uT2sbR0bOeK80aDXHFnpRH74+XQ2x8Jq+AmqFaDZKi5+kDkz3EpQMXXe6GJuS7PbVzQjms4+ks0TT2B7A9pWZT5rk7O7f2o4wsKsDo4yFy7MWAxPKfGFB5KQAXzHPAtCqgmmUQYJnRa/HEOrFqkvCNkVgKf2ySFI43wOSNT0DLNW1F+0YZJwxWC6W1f/4KumtmyQgwbMHMeuBliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEKctXN9SRKWsvXn9dnUlhoAihC2m52wgTUClgjFqkg=;
 b=gX3v3U3R5FrAvdT14VKQrY9gg49WlPWIwklCQ2WbTLFaYKOzGVVjNjsYe8Iyc+xsiWQnQsPTNXxukzMAvS5OrfFLOsGETwk5uZyPxmbhhBjI9w3PaTc1gKp3Lb+OHwK64mlob4aQW6P/YkDVFb3ae+e3pE6wnvQ5271YedsvV7g=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SN7PR10MB6381.namprd10.prod.outlook.com (2603:10b6:806:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 21:30:20 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 21:30:20 +0000
Message-ID: <eaf94cf2-7c7a-4d23-ba61-62ccdda252d7@oracle.com>
Date: Thu, 1 Aug 2024 22:30:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] print() action: identify ctf object used for print
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240708145404.1673045-1-alan.maguire@oracle.com>
 <Zqu83Oa3H8zKyw3l@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zqu83Oa3H8zKyw3l@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0032.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::9) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SN7PR10MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7c1e80-6fb8-4b6c-7450-08dcb27124f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVNXM0JscTdlc0txckJEeGYzeGZrMWVEZDR4ZXd2eDQ4V2M4UGd2eVljNWNo?=
 =?utf-8?B?Z0ZXR3RDMUF4RkNXS2Q0RndpMnRITFRtckpJSlUvSk1lVDVHUGtjQnhUWHFY?=
 =?utf-8?B?ajRXTElpS2gweXhJQnR2TVdaWkl6WEpaWWVEbUJVd0V5eENmbm1CWWpvSFl5?=
 =?utf-8?B?ZGlaMUlMZGtEV21MLzg2MSsvRFNUK2JxRjRnT1dxQ09GWitMVzlpUWNMWFhN?=
 =?utf-8?B?QW4zTVpGVVA3RzlxN2JhU2RVOUEvYUVnemlGU3IyenRyU204NmJKYVZQdDZM?=
 =?utf-8?B?WTlnMGV1TVQrTmdtMEVBcGFtWlViQjhvWmUzYVVuU0RXRUZxdWFzdVJEUmhI?=
 =?utf-8?B?VzRRRzVXcFV4UGs5akxOb1ZMT0dXcEthdHJTRWRMK0ZaSW9IeWNuMlV3bjFW?=
 =?utf-8?B?dHN2Rm1talE0aldjNDU5dWNERiszbEhmSUtXQWJhWW1TVXgzTFZKV3JkRWth?=
 =?utf-8?B?Zk9yRFBMQkFZYVhyeHV2WG9MTERQNVJ0YWNXa3psR0p3YUg2OTJwTTRFRzdR?=
 =?utf-8?B?WU5rYUxGdGRGZVBLdW5YWlNueE1YRGZId2hFWVNFVllPWGYxMG5FeWY0T2Vv?=
 =?utf-8?B?SGc0N3FmTEFocG9nQW1vSVhEREpCSXZsWFRhd1lOZmZlekdSZmVXMHh3VWtn?=
 =?utf-8?B?WVZudVZFMEMvOHVNb1dBZkpSUHJVWlRURmp2UWJHSGw3WGdtWEVJZDdFekNz?=
 =?utf-8?B?WkxuOHVMZmF6bHg2dHlPNGNKQjEvYm1Mb2hiYjhhODNRSEdtaStiNVpuZHd6?=
 =?utf-8?B?bTVjZjNvOGVnZk02cldJYmp1Kys2LzlUVTcwWGExYllVUC9iMFlEZGNDcm55?=
 =?utf-8?B?MVZYaVpiMkxucE5PNVJ0MTg4ckZQZmY4WmdqY3FDaHo5MGp1ZVd0ZU41N2Zv?=
 =?utf-8?B?c2JLRFQ4Q28rUE5McmVoYko3SWtWVVJOb05QRkdPVkRwNWtJdzFGL3EvOVVY?=
 =?utf-8?B?bWJKV2hxZi9jSEdXTGk3N0lxUm1ucXgwM3RvSnBXc1oydUYvWlVjK1lMajhn?=
 =?utf-8?B?VTRjS0s5c2YxZDlvWXFYU1VqSzRiUldoSytqSDdDUGFnSDZiZXVlOWo5blJu?=
 =?utf-8?B?dFpTVFoxUzNodDExTXZ2QTU4MUdoZDBaZVY3cTdEUzAwbXBGVTJLSVdRY2tu?=
 =?utf-8?B?OURJOCttbDVkbitZVDE3RWhFYUtBZXZpRmVrYjhoY25EMzU3cUpxd0JjZ1ZK?=
 =?utf-8?B?cEs2OUd3Z25mM1pWZXQ5emY3ZHRBRnFUV2VGNmNuZG9jbU5XWmE2KzFzbFIr?=
 =?utf-8?B?Y0dQZURCZng3MzY4QUlRY0VTeEhvMHloUlJoL2UwbmlyQUE4TS96eDlHNUFT?=
 =?utf-8?B?OWo4U09TN05rSVhBaC9QM2hxTHZEclUrNjdjQTBQbjF0aUp1eXdmYkMvcmNa?=
 =?utf-8?B?SDZKQ0dhYkVlRFZVdDBXOFhzOHVZdi9kRzVuNkcxQmo0Vk1nSjZ1MEJZaTd1?=
 =?utf-8?B?ZDJCRjFhN0xNb1VmZWJpc1BYT1UrS2RHbWNyVUdVN0pudVRUcnZIcFVyd3ly?=
 =?utf-8?B?V0FJbFYrOStNVkQxUXpkdkpuOHVaSGNrNEh6WG44cW9XVFc0OWdKSS9kakpM?=
 =?utf-8?B?aDdEYUpkQnN6c2NvK1NXL21qOEFGdWl5cXpwNXBTUEpuY1ZXbXo5UnBVN0p0?=
 =?utf-8?B?Ky9STE4xR050Slpob3c5MFRSRnQzRWJOcUo3STJOMkhxR3o5RWQrUms2emV0?=
 =?utf-8?B?eGI3eEVlMkZEajVoeVgvVlordzVrM2JjK1NsTDFpdFVNc0o4Y3MzZkRUanRW?=
 =?utf-8?B?VVN6MERWNU96TDNaYU1STEs2eHhZNEVzK3VzNk9vd2lKajUzZ3YvemJ3Q3dn?=
 =?utf-8?B?enE0TWtDYWpsRVB0b2YrZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEdXUjU1bFdLaFBTSnc3elUzbitWOUhqcENVYXBVZGc0OTdjcjBTbmdLbmVv?=
 =?utf-8?B?K0Q4Z1VaYlB0eTRGaUdVbDk0UXk3OXk1QXlVQ0RuSnJPbVVsaFJVOGNWdkt4?=
 =?utf-8?B?WXRmdGVuelV3MmNkYndvNVJiMDJ4dUJ0dksxZi9jaGtiNGhUSm1NVHhnd1Uw?=
 =?utf-8?B?MDNjanpmS0UzNUdINzlFajA0S09qZzBHbXBWMjdQcjhLOSt5UU82OUxQQU9U?=
 =?utf-8?B?Q1hHcFBmRHlmc0ZhbGU5VS93SlhJMjUweU94bWJlemtqYjVDVDZRQkxQVmFu?=
 =?utf-8?B?OHJkd05CaDBLSGdESE9Zd01rVWhFQUViOUJKT0lrUnVGa2ZJekJCUUJmSmxz?=
 =?utf-8?B?ZEdVUGtvQmlwOFBiSmtJQm44dUtGYVdkYU8rVlowd3hSMGl0bTZTQm9KNmE4?=
 =?utf-8?B?dm5GSytXdzVUcTZYVjNBd3hmOU9WcjdKdEJRMG1DRWxBbVp5WkhGdFRrSzMv?=
 =?utf-8?B?TERONmVlbWx1NnVSWXYyUVNXeXdTSVNkNFhrMWgwVGVaQXMxM1JkUmY0NWMr?=
 =?utf-8?B?UmRsVVFXeUNRdW5kQXVkd1N5Y1d5SlJlV0h5YUtvaVRkTDJyaW9ORjdEL0hH?=
 =?utf-8?B?U1NIOFVmS3RNbWNsYStFMWlmdzVkNk1tbXhUcmZjSS9KNk1iaTBXNFAzTXJx?=
 =?utf-8?B?TmwxN0gzazVySE5PTTg1Z0ZnRzhtb2ZBQzVoV2tobWkyTDNSWVV6eXBNcUU3?=
 =?utf-8?B?L1VCazM2c29lRytNZ0hLSW9LT0hTZWxiTVRPUVZuVk0xOGd4SS9FOHRVUExs?=
 =?utf-8?B?UXZ4WnRrZFAvV3pvRFlqWGprNmtISjF5TzV0TUVnK1ltd29wVnErWjhhKy9V?=
 =?utf-8?B?bXc2d2MrSmlGc05rL2RIcFRMK0x2RVhRWVpQOXdhL2NNZnkvd1NsK0U4TDg1?=
 =?utf-8?B?blFDOUpPbnpxWkkwVmo0dEhJRW4yUFFoV0oya1hmZzAyckVGaFcyM1V6RHBM?=
 =?utf-8?B?KytpejYwYXhyQjRHaGxPOHMzNVZiUE1yanpKVWJEOVppNmlXMVJDYjFhUktH?=
 =?utf-8?B?bnlxNWg4ZWlmRjJkRXNtSm5YNm5kTXl5bG00dW5hb0k3Q29xNkRnSjB0Rzgv?=
 =?utf-8?B?ekRvRXFkcUZ6cW56aHRUSDFqVzdKL29wMmo0S0tDZEI1QWxpK3lNWXF0RDBh?=
 =?utf-8?B?TitNWFJ3cXo4YVNNSC8vcktnbFhKY1NJVDBJb1p6ZXpNVEthN1BsQ29vTW1w?=
 =?utf-8?B?NVZRYTRZc21uZDJFcDh2UHIrR29TbFhUWnpVblJESjNOT21FNkpCem04WTk2?=
 =?utf-8?B?Y09EOHc0ejQ3TzM5TU5QTVlqTStIV0toaDFpY2dMNGNkdk50aENXd3VVb3Vw?=
 =?utf-8?B?dW5xVWUvaktXSUpBRzc3U0YyQ1Z3TXVCY1hJUkowNWJXNVU2K3BFS3JwbjZ5?=
 =?utf-8?B?ZGhORks4TURBKzFFY0hBYmdWak4vK052alR3dWZuNklmZnE0NjdWbFBhdXpu?=
 =?utf-8?B?TXN4aFhGUE0xV1lERjBRY1pmRkJldjE4dmtKS0NBSStYbmVieEJ1VFQ2ZHdF?=
 =?utf-8?B?b3BqVlEyblJXM0luTUIrNkRCNEpKL3pFT3QrRllDOWMra2VmcHN3OVY3T2w1?=
 =?utf-8?B?b0VEMWw0Sm5SRDNqcWMzTlVPTzNNMkpzZnZGY0h6bll2elRzQVNsSVJTajlN?=
 =?utf-8?B?S3FPUXM3dVN3aGphYkhjYVNudWgwVktEWFlWQXc0RDNtSEl3REhxLzZxbk94?=
 =?utf-8?B?a3RkanRRdnh5NHc2SHViMDN6MXhic3E2bnVUeDJFODZqcnpKd1gvZ3YxOUVR?=
 =?utf-8?B?dUx4WWZDYlBtNTlaQWROZG1rc0kyYWh5S1VUU1Y4b1QwVkkwbjlPdDJsd3g2?=
 =?utf-8?B?Mzl0RjZ2TUxsTEJhajBlSU9FWHpzckxVNU5MZ2tjRmdsQm0wQW16MU83c2tP?=
 =?utf-8?B?LzUzQS96UXl1dzhtVHB3RDdZdW14NTVObGk2REtqelVaTS81b25leEtZWFc3?=
 =?utf-8?B?WjJER1dJSWJpVjY1Z2h4V2RBMDRRRmZhR0JzTjV4dTJmRE1IMVhhbXRobWcw?=
 =?utf-8?B?bk1kdWlhTzVSN1NpQVNGRmk1dlpFcWpmb2U4UCtPVVlvdVZQdXRqMGlKdWZt?=
 =?utf-8?B?ZHpNenhEdUQrODFXZmNHUVM1WEJRVlIyNXNGOXVWb3hFUG1BclNqemUvWUMx?=
 =?utf-8?B?RVl5SmREQXhaUHZBTWFsTUtMU2lLcUd2bDZsN3BIeVc1bnp0L0hEYm5RajE4?=
 =?utf-8?Q?gNu68fYboAoSFyugPRd11I4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yoW1+5AM6OxTe1L3prLg+3pn1pkzaXUyLmkxFYA/tywglEthX3v4pKttkYPMc//SK8UVipjY1U6Rl4B7Fz1aRXmhMFWQsTrf7vznhMfZADfPU/6swGzTz86FVplmkKNH8ufDFmnG0c2wc/xpVOUzNRwJuUiuYT0yMDCnmbQM5dBaTa8kqGoJo+WmgqgCCeRb9QAYURvcez9uiKrYbwc8FBdSMyFQNjUelXJ2Rqkg+cNJcj9NOFRngRtKysdd5H5Vgs/e5LRAtVWA6bjhiP7a3N8GrB/68jFXzQS9jODhWqhpq4ZDcT9mrTmbpBKEv9cjMtQD//VWhcXl8WYCBjshMeESzFyzRlBlxGqJ2ngsDCM0dx1pvvB8PfBgK5SBpLueydCInnzwTZA/gbUu/YNZ57OoF4KRt2dc/lNqinWYMYkOis6kWd7FcR42QmIx8ClpKfASlOMgmQLmNIy/zXP5Gs0qJvrlWGhtTOJA5IMgvp9e9/r7f76n7vphbMXlNkyGyGrdf1Jt2fRS348lxQfgHVugYohlV6Dlxwvs7scAA66yCa1eQoU3njorrIhdYuMU1MNyA+NBYsezz5mXRhhB7O5nvZjXcGTeCTHVCMEz0Mo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7c1e80-6fb8-4b6c-7450-08dcb27124f3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 21:30:20.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6z8erIwOIrQgGFL6Vjde3H1qOAxgLVKK5q+Urz0FMkFBAd5Vaei64fLW3vMkcycDlmZDiqJ83OZMkSlL+eEXJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6381
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_20,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010143
X-Proofpoint-GUID: tMCen30-7dN6nYoFlScEVgUdLOuBBpul
X-Proofpoint-ORIG-GUID: tMCen30-7dN6nYoFlScEVgUdLOuBBpul

On 01/08/2024 17:50, Kris Van Hees wrote:
> Small question below...
> 
> On Mon, Jul 08, 2024 at 03:54:02PM +0100, Alan Maguire wrote:
>> when generating code for print() action we need to identify source
>> of CTF; is it shared CTF, cdefs or ddefs or another module?
>> Rework the print() action to be a printf()like function under the
>> hood using the format specifier as module name.  We can then
>> do away with dt_print_print(), calling dt_print_type() directly
>> from consume.
>>
>> Suggested-by: Kris Van Hees <kris.van.hees@oracle.com>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_cg.c      |  8 +++++++-
>>  libdtrace/dt_consume.c | 28 +++-------------------------
>>  libdtrace/dt_impl.h    |  1 +
>>  libdtrace/dt_printf.c  | 28 ++++++++++++++++++++++++----
>>  libdtrace/dt_printf.h  |  6 ++++--
>>  5 files changed, 39 insertions(+), 32 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index a1c24e37..2eb2df9c 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -20,6 +20,7 @@
>>  #include <dt_dctx.h>
>>  #include <dt_cg.h>
>>  #include <dt_grammar.h>
>> +#include <dt_module.h>
>>  #include <dt_parser.h>
>>  #include <dt_printf.h>
>>  #include <dt_provider.h>
>> @@ -2838,8 +2839,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>  	ctf_file_t	*fp = addr->dn_ctfp;
>>  	ctf_id_t	type = addr->dn_type;
>>  	char		n[DT_TYPE_NAMELEN];
>> +	dt_module_t	*dmp;
>> +	dt_pfargv_t	*pfp;
>>  	size_t		size;
>>  
>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>>  	type = ctf_type_reference(fp, type);
>>  	if (type == CTF_ERR)
>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
>> @@ -2849,9 +2853,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>>  			ctf_type_name(fp, type, n, sizeof(n)));
>>  
>> +	pfp = dt_printf_create(dtp, dmp->dm_name);
>> +
>>  	/* reserve space for addr/type, data/size */
>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>> -			      sizeof(uint64_t), 8, NULL, type);
>> +			      sizeof(uint64_t), 8, pfp, type);
>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>  			      size, 8, NULL, size);
> 
> Why pass 'size' as record argument when you are already passing it as the true
> size of the record?  That's unnecessary.  We can clearly get the size of the
> record from the 2nd record's dtrd_size.
>

yep, good point. I've sent a v5 which doesn't pass it as an arg and uses
record size below as suggested. Thanks!

Alan

>> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
>> index dec2314b..e6880703 100644
>> --- a/libdtrace/dt_consume.c
>> +++ b/libdtrace/dt_consume.c
>> @@ -507,7 +507,7 @@ dt_nullrec()
>>  	return DTRACE_CONSUME_NEXT;
>>  }
>>  
>> -static int
>> +int
>>  dt_read_scalar(caddr_t addr, const dtrace_recdesc_t *rec, uint64_t *valp)
>>  {
>>  	addr += rec->dtrd_offset;
>> @@ -1983,25 +1983,6 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>>  	return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
>>  }
>>  
>> -static int
>> -dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>> -	       const caddr_t buf)
>> -{
>> -	dtrace_recdesc_t *data_rec = rec + 1;
>> -	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
>> -	size_t size = (size_t)data_rec->dtrd_arg;
>> -	uint64_t printaddr;
>> -
>> -	if (size > max_size)
>> -		size = max_size;
>> -
>> -	if (dt_read_scalar(buf, rec, &printaddr) < 0)
>> -		return dt_set_errno(dtp, EDT_PRINT);
>> -
>> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
>> -			     (caddr_t)buf + data_rec->dtrd_offset, size);
>> -}
>> -
>>  /*
>>   * The lifecycle of speculation buffers is as follows:
>>   *
>> @@ -2562,11 +2543,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>>  			func = dtrace_freopen;
>>  			break;
>>  		case DTRACEACT_PRINT:
>> -			n = dt_print_print(dtp, fp, rec, data);
>> -			if (n < 0)
>> -				return -1;
>> -			i += n - 1;
>> -			continue;
>> +			func = dt_print_type;
>> +			break;
>>  		default:
>>  			break;
>>  		}
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 01313ff3..88b31ce0 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -789,6 +789,7 @@ extern int dt_buffered_flush(dtrace_hdl_t *, dtrace_probedata_t *,
>>      const dtrace_recdesc_t *, const dtrace_aggdata_t *, uint32_t flags);
>>  extern void dt_buffered_disable(dtrace_hdl_t *);
>>  extern void dt_buffered_destroy(dtrace_hdl_t *);
>> +extern int dt_read_scalar(caddr_t, const dtrace_recdesc_t *, uint64_t *);
>>  
>>  extern uint64_t dt_stddev(uint64_t *, uint64_t);
>>  
>> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
>> index 50842216..d794dd47 100644
>> --- a/libdtrace/dt_printf.c
>> +++ b/libdtrace/dt_printf.c
>> @@ -14,6 +14,7 @@
>>  #include <limits.h>
>>  #include <port.h>
>>  
>> +#include <dt_module.h>
>>  #include <dt_printf.h>
>>  #include <dt_string.h>
>>  #include <dt_impl.h>
>> @@ -2235,15 +2236,34 @@ err:
>>  }
>>  
>>  int
>> -dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
>> -	      ctf_id_t type, caddr_t data, size_t size)
>> +dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>> +	      const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
>> +	      uint_t nrecs, const void *buf, size_t len)
>>  {
>> +	const char *modname = ((dt_pfargv_t *)fmtdata)->pfv_format;
>> +	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
>> +	ctf_id_t type = (ctf_id_t)recs->dtrd_arg;
>> +	const dtrace_recdesc_t *data_rec = recs + 1;
>> +	size_t size = (size_t)data_rec->dtrd_arg;
> 
> Use data_rec->dtrd_size.  No need to use dtrd_arg with a cast.
> 
>> +	caddr_t addr_data = (caddr_t)buf;
>>  	struct dt_visit_arg dva;
>> +	uint64_t printaddr;
>> +	dt_module_t *dmp;
>>  
>> +	if (size > max_size)
>> +		size = max_size;
>> +
>> +	if (dt_read_scalar(addr_data, recs, &printaddr) < 0)
>> +		return dt_set_errno(dtp, EDT_PRINT);
>> +
>> +	dmp = dt_module_lookup_by_name(dtp, modname);
>> +	if (!dmp) {
>> +		return dt_set_errno(dtp, EDT_PRINT);
>> +	}
>>  	dva.dv_dtp = dtp;
>>  	dva.dv_fp = fp;
>> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
>> -	dva.dv_data = data;
>> +	dva.dv_ctfp = dmp->dm_ctfp;
>> +	dva.dv_data = addr_data + data_rec->dtrd_offset;
>>  	dva.dv_size = size;
>>  	dva.dv_last_depth = 0;
>>  	dva.dv_startindent = DT_PRINT_STARTINDENT;
>> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
>> index 9771c4a8..4f4386a5 100644
>> --- a/libdtrace/dt_printf.h
>> +++ b/libdtrace/dt_printf.h
>> @@ -108,8 +108,10 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>>      const char *, caddr_t, uint64_t);
>>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
>> -			 caddr_t, size_t);
>> +extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>> +			 const dtrace_probedata_t *data,
>> +			 const dtrace_recdesc_t *recs,
>> +			 uint_t nrecs, const void *buf, size_t len);
>>  
>>  #ifdef	__cplusplus
>>  }
>> -- 
>> 2.43.5
