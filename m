Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777D8145B12
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721337191; cv=fail; b=g2i+AAbdsoGjK/9MiWc656+FScfhSrnTbONuOCKuKmkxh86IEsv3MwIVq2m0LEt9z7EsJikHRyburOJDNlXh7ds3gOvmjjn7sVIKt+WC1VINc3zG4hiNdTWtuglZmxrMdTab7DFHZOlZjX2D0Ny7AOfNRDNb3xFyhSRmJLlDp6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721337191; c=relaxed/simple;
	bh=CHUp5P3V2CiqxgURUfWeG7AmKq4V7pYXWJ226MR5KUw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CbVW+wRnxca7LOqr646rzNSb5V+qkN8f4X1AfbkcyEMbnY2+3W0/yXXNOvwoGSo11whGQlwAKGd0eZDyC7JcfsInUtnb+dxC5vgVYZuerp8VEWQVHKwL9LX7v75NWWW9zQ5poaokILROQXFcY+65pV8iyfo332F14eDvqIa6HBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gmzWTmHg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LBx45Bbb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gmzWTmHg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LBx45Bbb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IL4K9G025488
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=M2CX1fkWshmKzGSAzvQd82ylrhrIw0v8NzEmaneUrUI=; b=
	gmzWTmHgRlzy2Te8BvTQs+nvvk1edHBxoU4Ckw8acczhyxmXIQrI35l0jXPfY+n4
	UjK6wxb1CRvoZE3JhdW3wuCix6afeaC3E0dXyzv3LjhxSwVylpHWSkQxwNCY2Aih
	whHxHcmBUxU70cwEztXl7t9CeE80yRI7ZlAF9iFYHoxWnCCN+1PGruJJeEPbIxft
	iosYfuxzRvfONhfssn3rWwQgeblrldg1cLdKDcZcewA2QuWFCoUehu/Fgcw2O9d+
	8SbHWUf5FV4TMltRbzD1YrC+kkM7okKFe3Z0A7y7eaAby6V0uTLtZZgfYUnJURLt
	47aDrYl5o4rC/dif/fjSeQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fak5r0rb-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:13:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJD0hK039531
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:06:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dweww366-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFVrofjKuYrFrOcO+5D7NHeNud0HEGDQyl4w+m6oMzwg3EDNhepdokg63yp5vLTAn7haY9vaaR7E5ztGQWniGlZsIcoaLUGIZNt86dfinMu406gnQ7S0iwPmZ4Mt+LFjxtcx1gYRN76x2vqmZ9f4bbLiyNqHOopgnPjiqIj8KqobK62CeGHwogJojofFDj4hGooBIVjkFzcELGXeZ7MK7Q9MqYiyw4BJCU8X6+chdyQ6SY4AlPv2P+hOHzwvuJc2BcF+duq+Y2qO0FbPAgiKdjGUcivP7DPV5APjXiJoyu0Yi+DzbQ+pWxD34Pk/az21fimhdKdQGWmVCU0Jf430tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2CX1fkWshmKzGSAzvQd82ylrhrIw0v8NzEmaneUrUI=;
 b=Qp9IyxT9Vmzk6tL7ITgQz2H6svrWHKOr170YKy80bvcRhQGnNOfFKEex1xC7iyTp2ZP+RfFI7dCPoCl2aU94sl9k3QPolMHfmPTnusn2VQbzAZPbLrSff9BbZi4NVh09yaJz6AjDaQbRFaU5ETBSprXukQZqlfLOKQO9Y2i+CSfytAS1W8HNbQYgSugHraedR1YV+JwhNpWl8ylCXbqRhraUuGp/9c7eogvpaSLaMWfWirRdYXM3E0jw7wlMAYMl/+VSj9IhVHar9zEZ1yK0ZsLFiUzLsvQR/IQr5pnSn9DMvXQyxI5SsBoFjaI5weGN98agrSD3g8KNUM8IfgS2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2CX1fkWshmKzGSAzvQd82ylrhrIw0v8NzEmaneUrUI=;
 b=LBx45BbbAG1mLM+XVL39Cg8AQZtegx/dA1eKSFaqB4aMrv2rrkDhN2Vvl38rtB+ONhfv7EVeuP4Xdqpq6tS8o9T0O77uSy9gHmcaaOQelctn1wrhVlqFHX44AF1+PFve9YzCihl/XGrdg6l+Z097GxMagO1fzNCuzTdtQe13AfE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4610.namprd10.prod.outlook.com (2603:10b6:303:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 21:06:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 21:06:03 +0000
Message-ID: <4518310b-abf9-2e8b-e2de-8ad358adab00@oracle.com>
Date: Thu, 18 Jul 2024 17:06:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 13/38] Hide dtrace_actdesc_t until it is needed
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-14-eugene.loh@oracle.com> <Zpl00nXBgngkAvHt@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zpl00nXBgngkAvHt@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4610:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b573d5-647b-4fba-b943-08dca76d6e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zkx1eDE2SkdhaGhHZ1g5aGUzanV4dVRFV3ljSjUzMkdrc20wTGpFaUoxbnVr?=
 =?utf-8?B?RytNellqcC9UanpjQjNmeHFvRE12UUFoaHBsTW42bE5vK3N6SUV4aWJBVkdN?=
 =?utf-8?B?eE82TFdtSWlQU0p1c3RreHcwUERaS3pGdFVQcHFSclZ1ZEtqaEZ5cXRUb0hK?=
 =?utf-8?B?dnM5UHVMKzROMytJQkxrQTFQVXlhVzJRNFRXdU5YUkNnc2JXdWZlMGdoQ3B6?=
 =?utf-8?B?ZnV3WStYdW1kZkZRWlUyRkhCVWNaY3R0LzdybmxsSWc5VjNiTG9tK0Y3c3VN?=
 =?utf-8?B?U1ZOWkhGYjk0dWZEbFhzdFJnR2RVb29RQ3BnMmdicVdHeURFbHBDNjU1Q1Nx?=
 =?utf-8?B?T01GS1pyYW8vdEt6cFA2Z0EzRGlVQmNIL3ZoUWVHTFR0NnMvNmJwdVc2dTZP?=
 =?utf-8?B?dUN0Smp4TnRqc0wwWURxRWE3NEpWTHZVYXdleGR5eit3dzJJWlZyaE9OaXNt?=
 =?utf-8?B?MzBINVUrNm9CTEV0eGxqb3pIc0NDRmtaeXdEQkxFK3RWU1UvRlhhbHU0MXVs?=
 =?utf-8?B?L0ZnYjRHMGtkS3Zxb2pYNTdxZWNhNTRQVkJIT0VqejQ3R0NGQlg5b3pxd2lF?=
 =?utf-8?B?K2J1SVpPVWg5NWZndWxzU09SUEl6b0Joc0g0ZVM2WEFlSm9jUGJqU25LeDQ2?=
 =?utf-8?B?aEx1VVYxWVpzT1BrdzNFeXp3UDllM0pTZUFjR3dwdnUxbGYrZkVqTXlxeVhV?=
 =?utf-8?B?UVY2VWd0SWdsenFra0dVRXBBVnpSZUhTWVlOc1ZGQVlmcTBEY3BLNFBnY2JW?=
 =?utf-8?B?Z1FOZXpzRU51M3crTkVqb2NwUGdDdy9TVWo3UHB2WWtVYUVJaHBLSk5RR240?=
 =?utf-8?B?L0FJa1drcXhmVGtqQzFNZlNjY1JUUmVtQnlkSWlrcC9NeURmVXI0VkpQQ3Z0?=
 =?utf-8?B?MTl1YWtmMzZqbDQrK29ROHgyT0FydlNwaWtaRU9KRFNCNVg2U21oc0tURmNt?=
 =?utf-8?B?akNKSllCVzVyQ3FHQURKNDBHNTkzVnh4L2tKcE5rRy9QV0xSbFZRemlIOFdU?=
 =?utf-8?B?WUlyZUw5VHRjUCs4RzJVbU4xSlBQZEtEK2pKNUlGbHoxWDh3TTN1VFpRVTBJ?=
 =?utf-8?B?SVQ2L0lDVkVjRGRVazM1VHo2TW9IenFBOUMyRFlIV3Z3K1B3ZlhZVksvaXNW?=
 =?utf-8?B?bDBsMlhTb2lORHhodkF1Y0JFaTFMdjBENHVZczl2SGdpQUxHY2dIUHhESWFh?=
 =?utf-8?B?STBQSVVlelRFeE9HVjQzVEpTaDZMNldOU2pXNGl6RE13clM3MTNza0FaNWNt?=
 =?utf-8?B?dzNmeENzL1NPUUJEUGVSejFPYkNOMlNFWGN4L1ZrdzVsTE9YQW1uZWV4Slhv?=
 =?utf-8?B?ZDRVZ3c3YVZNdHRMQmJ3ZjVUajU5MG9BODZCWWhyaHFRSitPSkR2Mnl0bGht?=
 =?utf-8?B?ckRDazlLSGIzSVQ3THo2d0h1VnB6QVhFYVEyYzVka1JSd2EweUUxRWhBYXZE?=
 =?utf-8?B?OTN1cEIwWHJuS014c0V2QnpYWDRVd3RoMEYrOUpIRlBpNTcrMWlRVUpyWkx2?=
 =?utf-8?B?OSsrQ21WWmg5eC80QkVvcmpEbEUzaGZ4WlBVY1R4VXdnNE54TmM2SEZORlAr?=
 =?utf-8?B?QkUzQkt6NENLcUtLbDlrNXFJU2VrMXlvRDNxMTEzNVVSQ3M2MEx2R0VBdGNK?=
 =?utf-8?B?Rml5eUJhYlBHUjNEQ1AwNU9TYUkxV09kb09BQzlqZEVDRDNRcWFRcFZidUJO?=
 =?utf-8?B?Q1lBTFBrOHFCNHA4bEVsZSsxK1VSY0lEaUdUMEE3OFBGb1daT3JXZGxtMEpL?=
 =?utf-8?B?eFpjT1B2aDRrSkc0R3RUZ3A3dDlGZ29uT3JCZ25NeDU3bStUV0paZnZJU2sw?=
 =?utf-8?B?ZVhsWFhubTNJZER5Mk5aQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXBza0NuM3BTUWNJRFphcmY2RHVFN1hiVVZhcmIrT3Y5SHNpNFMzYzhQeC9W?=
 =?utf-8?B?WFRyNm5NWW5rM2RxRll5VGx1SFoxZ1hTK0FlL2pqUm9pazQzZW5qcjhQbDFr?=
 =?utf-8?B?eDFodXRDZ0NTOE9kU2huZEI2aFR2UlVHUTJaeStzcjJ2T2hsdzVBalRJUTdJ?=
 =?utf-8?B?VjM1bFNqR0o3STdqMmxaRm4rNFJqUnJuTjU3WkcrcnhBSjVXNzUzL2RDazZv?=
 =?utf-8?B?NjVpSlJHeVF1MUlCWjdXanFOUGFiQko4MVoxWjNOZ0lsbzN5bG82U3Mwendk?=
 =?utf-8?B?ZUhpa1c2bS9oSk54Y0t4cEpuMXpoZTBVTmVtNVk3bm56R1JmRkIvZFp5QjM1?=
 =?utf-8?B?YmhoVWVKSEgwaXRreE94ZmNHNXo3QUZxTnNEY1l2bERsaEpSVmlSSGMxOU9w?=
 =?utf-8?B?eE9HcGg0dUVza1RwYlpnYWx2V0ZJamhTNGJEcFZHa0Y2UnlwTXZ5M3E2YkNu?=
 =?utf-8?B?dVk1NzUrWHNrNGYrL2M3OCtaZmNTSDlkdFh1SDVVQnBDaVd0ZWt6Rmp2ZCt3?=
 =?utf-8?B?R2pXS29tdFgwUXl3MUg2T21YRmdWS2UrTTJJRmtGUE9zc1AvcjVVY2Jaem83?=
 =?utf-8?B?YTk4UlAraTdOUVRscEVrNTRJanFjWm96RXFGL21NWUQxeUpPWlVCOGhZU0hw?=
 =?utf-8?B?aFhFWU5zUWxncnllMVp5N3cxZHBOb21YcTZWeHZoMEp2TkpBVWFXcUxGNEpx?=
 =?utf-8?B?SThmNjRSUGcxZ1lyWFdpUjJ1SmpwM3l0dW5mN2I1czJZR3B6SFlyV1BGZ1Jn?=
 =?utf-8?B?ODVyNGpCNllXTm81ZnFjQ1NPQ3RUNWxncG1jY3Fmc1JBb1JOUXRhazgzOUxs?=
 =?utf-8?B?YmYvRUdFVG9aeXVET01RaFV2ZlN2QmdUeGxIak1wUml2VHpndTJJYW1NMWgv?=
 =?utf-8?B?UWVtL3ZyZDBwS0x2NzRWK1g4TlhVTlNQK1lxNGQxcktQdCtCRHQ5Z1gxa2cw?=
 =?utf-8?B?YzZqZTVaTXIwRkRmdE5vOTU0RHh0OVgwMEgrWTRMRHlGWEdybHY4Z1NBWjFK?=
 =?utf-8?B?RFd2WWRCWHgxVFNVZG5tcU9hTU4xN003cWtvbTcreGNMSS9qYkpsUVY2RDAy?=
 =?utf-8?B?b2xrS0FKb1F3V2ZxZDdtOXFsUS9PZXczU2tTUk9nd1h2aW9PdHp3QldwMDhz?=
 =?utf-8?B?enljbG1Jb0VpVm1FaHA3ckN4emRmWEU5aGROcFVETEZoWk1PQ3pPWlpObHhv?=
 =?utf-8?B?YXB4RGVyRUptR0xzYjVVTnlGYVo0NVFIWTE0QlJQeUljQkZGZU0rZEs4TUtj?=
 =?utf-8?B?aUx3QUJNM3NYci9ybHNCNEZmR1UxeDZzdDZZdXhTdzNhQlJpeTZiMnhBN0F2?=
 =?utf-8?B?a2VjcW5WUUlvN0Y1ZFJZbUx4eXMxQW92UUc0bzVFeGd0NXRDVU8vVFhRb0pE?=
 =?utf-8?B?VVNwcXB3Z3dBWmppT2NKUWhsRTlSckJXZUtoMFhHOHlRM0VWK3kzQXY0UHpU?=
 =?utf-8?B?aTB2eXdtNjFxUE1FclgraVp2TGd4RHZGU3JOa3FzekxrdzQ2VG1ORFpEb1RP?=
 =?utf-8?B?VkJ2eTQyL01vWjhoUS9xWForclBrZVFiNzRVUFo4V0N3U2lqU09xbHRwSW9W?=
 =?utf-8?B?NW1PL3ZTT09MaE1iUG1JRmw0TndZakpPSEVSdzZnbDAwaGdLVFkrZnRaUzN1?=
 =?utf-8?B?VHNLNEZxRi9yOXBUOG0rUHBVMDBhcDI3ajZuUzFwUEdUWmpPYVpqK2x3Njgy?=
 =?utf-8?B?QjgrbGdTbDJWT1ppVGpIUFZRc1pUb1JRUUFQem5yaTZJUmd5enYyQXhUaU5F?=
 =?utf-8?B?S1VFVTN0cHZsbWpMOVN1Rnp0enZZc1ozUFVHaVB1MEFTVE92aG1penpnRVQy?=
 =?utf-8?B?MGpGVlg5TVlvMFVSbDFrYzhLMXBSaUhrbDVDbDF1dEJtd3hmZm5zcFppUmRP?=
 =?utf-8?B?dklVQ0c4VUVIMkpJNmQxTmxpd1prL2x5cjAwajNjOFFHRnhMaG9FbXVDaHJT?=
 =?utf-8?B?Zjd2UnNYaHA0My85ZTFPcmt2VllSYmluc3NtY2JvL3pBcFpMYXZoRmkrVlJa?=
 =?utf-8?B?bjE0angxQVUzaVNKWlRlUFpWdWFZeEZnMkFSK3NPdUJlWUVqQ1hWUHI0SS9s?=
 =?utf-8?B?TWkreVFTM2Y1alBtY0hXS0NiOHdpYXVKVEJwcE9Eb1FYTjdKc2J2T2daUEZT?=
 =?utf-8?Q?ie5NMIXuCU7W5na8aFjg7Z6Pb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aJR+SWo1qFFR4YWuiLI18TLSnNzVccIcgaQHmVH/e4vZflzW919kiM7Mn5YXIM9N6mgirrUZt8BaJDkeBst2BSnNNR2VarNj9gCf9vcsSlZDDnyGGgvp2kHOG0FPmmo44ycepQcRdn67mTzjiuyFyUu4KjFK6heOKh07N8ntbE0gXfVPluzHVPSSPNw9hMqhHuq1oOBnfVy+M5wPOTsDa+vvEH0nWuHQSOUVx/3kglK/HS7PNtUGRj2+am1sYQVogJmHPbjgZHjHYM+x0XXBX1kHkGw2ZcqgvQBPQCqKYTh4JNupyQCf5BSshtJ8avImJRrrqKKn/JvCdlDgZcF+kOrASk4lvGoP8h3rYBK/RDfMsZaT9yW8P4t/J0LmEAGy6lRi7xpFmc4a1/YiSG0z+GnjYLonHAD3ngJOE40Ndijg+znp+K/KDmSzAcyTU92NCbDZfqVZZjPTJVZvEmOovG9yw/M8fmW+2LP5cfUloQ1zcuQIvmtUdGkpN5iYycGFoDYon+qPatXh1Qzk3N6GOGcRDW0rFjh4lM0Fq33Wn84Z+kDjhVkpEmV85+QiPgck4K35qk4iO5s5g0/hutS+fEDREMPQtXl2sC8uMgX5PDg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b573d5-647b-4fba-b943-08dca76d6e8e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:06:02.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiAQ1e41M7JFFaKQX9YGN0wq61UR16Za00NqY6nDPGlBopBd3EorZ9Xau1Zdh0sQ9HVhRb44o0raOova25noYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4610
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180140
X-Proofpoint-GUID: ndyzaxsxsQQgAL4PN-8vf0Du2GgbAdTA
X-Proofpoint-ORIG-GUID: ndyzaxsxsQQgAL4PN-8vf0Du2GgbAdTA

On 7/18/24 16:02, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 01:34:30AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> I think you should just get rid of it.  Worst case, we can always revert the
> patch.  But this type is only used in code that we do not plan to revive since
> we no longer do DOF the same way as the older version.  Even if we were to
> re-implement the functionality to save compiled probe programs to file, it
> would look very different and certainly not be action-based but rather BPF
> code based.

It would seem to me that the declaration (this patch) and the code that 
uses it should go together.  So, are you saying the inoperative code 
that references this declaration should also be removed?  It would seem 
funny to me to remove the declaration (this patch) while (admittedly 
inoperative) code that references it is left alone.

>
>> ---
>>   include/dtrace/enabling.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
>> index f1ec444c..2562c87b 100644
>> --- a/include/dtrace/enabling.h
>> +++ b/include/dtrace/enabling.h
>> @@ -43,6 +43,8 @@ typedef struct dtrace_probedesc {
>>   	const char	*prb;			/* probe name */
>>   } dtrace_probedesc_t;
>>   
>> +#ifdef FIXME
>> +This type is used only in #ifdef FIXME code.
>>   typedef struct dtrace_actdesc {
>>   	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
>>   	dtrace_actkind_t dtad_kind;		/* kind of action */
>> @@ -50,6 +52,7 @@ typedef struct dtrace_actdesc {
>>   	uint64_t dtad_arg;			/* action argument */
>>   	uint64_t dtad_uarg;			/* user argument */
>>   } dtrace_actdesc_t;
>> +#endif
>>   
>>   typedef struct dtrace_ecbdesc {
>>   	dtrace_probedesc_t dted_probe;		/* probe description */
>> -- 
>> 2.18.4
>>
