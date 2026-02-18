Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ABE1F1513
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771393128; cv=fail; b=rNhDAHWDaksFmqSg1anpl9AHJ9JQ9CRDCmOjyZH7quLcu1IskTg+XEerZdm1lhD+7znmk6IyHxCdm10hgFiuDM7EYtKpPOI0C5aRXN4sqrGgIQzW0fgH11gz7YFBlLWAGMTfVw4jZ1gOlf7jAn81u0EJdyYcG31JATh2McIvvbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771393128; c=relaxed/simple;
	bh=vfc/z0ZbHXuz3PHeB5BsPf7hRf3GVI/uMxFFsEYUQdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QNKhEFHi2NYcmclZoDelL5TiT6ZmEFYKScbu6OA1gfUY6RUzS9UCUtdqarfZ/eGlvXT2TI18I+8Pigmq9mL8LICSSnO9v8KJCzVqrjmTKFkMwx9OpQ4ebEneUF0mUuZIbyoEqqNKYCdajVYx4GL8Gedo0H8x9o6q+hw09Cx5wUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rOM71uOy; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SMFkzRMl reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rOM71uOy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SMFkzRMl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I2FnTf3789037
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2s9aaMUmPw4dKKpcZSB7/F6IG0/hmL4UWS8AD2/D7vc=; b=
	rOM71uOyyTsSmU7ZoEPUD8koPx1ue/bR0WmZ2m5pWmhYGBrA/Bh9C3vCq6uYmr/N
	CHSg8HvTBxB/KD5iCA/UPmgl8wJ/h2t+3vJfjMZxlrdpHFkrmR8rYqNHCcdhXEsX
	NnXg2d7qkMWfAceGZMPzawgDe8mmmoo/ertRhh5RmT/GLp9p2bm1p0ZLwNeiJfQt
	JELGCxeiPGeeruc59USuZ4zVn3mvcnMHhOtv0+R+q+NiZl2Nsy9Ro7kVYIfECNas
	+cnnuT6RE/LnJNHv3KWlI5B9w5EH2q7FIzu4ZCqnLau4kqLpLmkgZlEFZhHpb7GY
	CbwZ5H1mHbZQSAO6EwcDSA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r4wnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:38:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I2I2lL038995
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:38:44 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb23drgf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPy0R21w0bfRgDf4oKwX37u8BROyaKcHipkzHkCALpvvYx5ZNtv8VHU1xhGOBWEWv5peAq21Wcn4nwGuWrPgo4+v2BotL8UaolQCkitMOo9ykAHz8+YmjpeFC8ORHfbJcC6h65ouSQdgljQFP0VGpLxuA11YqQo6Q7wy+tnuQSsrucViSvJaq7YEbLd0ISqQdjClc8tTppZbQx2qY98wjwQp6cuBuVWBHoqMOe5GKy6l8oKvms3k+L0L716gJ0vgl+N+2EulKJuFPIKRPTXfks9BNOVBcOcReTQ5F9qFHFE70x8D29xe5LcF+c463eiieK6p0gDjpLaKkiw72wXjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tns2xftIIXr00/DO9zg5ILvFqJMuLTjBqjM1lWRUoVs=;
 b=pet2SmuRyg2LqE3i4r2qB9xIN4GeWRlTxC3mJ/1300F9ZGDn290ZVvkduz/KDyIyWnDukDnmtUikaIAU8+shiKgBQS31ROZbcT07HF84zno3OO48YG0cMrpisGA+cKkTfQLIFjBY1gpmOdr+81VTIFBIwERjrMx84LXpaVv0PHOmSq/ru5jBjEx2FVtDSQ5fMOb+qMcuOF+b0BEELu4In8LLzD2K9LOgvw7b5JC9nqUsSRFpov5bxaBCbtHRIgBRJNqlXKgEahmXdxSFnm+zaF3JvkR1sEq8Urma//njqts0yJm8COTQbhPs6KAslQTRs4YkSl+1pTtrcp2NWirvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tns2xftIIXr00/DO9zg5ILvFqJMuLTjBqjM1lWRUoVs=;
 b=SMFkzRMlfe5adqis4XF5rXJfasUVoMKXwtFJaDIGnt1CXZG6wj1/FrsIITZTK1DxJP9YL39HT2+Pp598PwpzQYuaLe7X7iKgI7vCfF90Xdw6FLSL37TolUEsgLZgX+zFSLsJb0YCwtiEDyofKxKPR/F8Xnu0DzY2XtqpDipqpEY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV8PR10MB7845.namprd10.prod.outlook.com (2603:10b6:408:1e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:38:41 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 05:38:41 +0000
Date: Wed, 18 Feb 2026 00:38:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] configure: add support for
 --(disable|enable)-dependency-tracking
Message-ID: <aZVQX/lxxmFT2Zum@oracle.com>
References: <DS0PR10MB7522C462F5DF76BD9E145DEEC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <abf2b87f-940f-1444-73d2-30d5b64a5102@oracle.com>
 <aZVI/VAgoFjieyb7@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZVI/VAgoFjieyb7@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV8PR10MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c45be8-256b-4349-cb04-08de6eaff93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?mylGmb4KSQzSD/+ZAkd+95bQoNwTZZ2KB8HuNWR+mhD5QqbU6WWkkylcrL?=
 =?iso-8859-1?Q?A1N293gVo/8ay4wy9RWdkCxuOv6e20dbCKEPAOIBjhMYUO+zz/2HVZEal/?=
 =?iso-8859-1?Q?x8CtbmU+Fc3A9WXIQhC8JBOlN/oQ5yBPHKLeLgDDW+19xyW4jMSEuzB1P5?=
 =?iso-8859-1?Q?e4VAno/66rwMwhc+URqmZC8sRb2ZcSYZWdkhmatNAUE5zkBdnEAxYv/CLR?=
 =?iso-8859-1?Q?P0YCe9aQ7xP2Vj6OwpCgxlmdJ4giH7/ZKFXqO77BT/mv+piCOUwSS9ZcGH?=
 =?iso-8859-1?Q?vhjXoFW0I+I/Ub9TPWtvOSuUhG9u36Ga1kavuWETk/rMXTN7KSRBkop+Y/?=
 =?iso-8859-1?Q?GJf80WEWc6iqHFuaA36X0vyE6NH+mbdaOsm9Z9gXJAtsvgGSje/9OdwuoK?=
 =?iso-8859-1?Q?IyVwmoVEKM/IXUTaMI9NA2KdvYatul27c1A01NBKgv9rrjRrVAueTo7apu?=
 =?iso-8859-1?Q?ENSFVRi01lm9tQR7AMyWCSJnqEGjXa2oIIBXGudzzrnTAlpXSnVfn5SiQK?=
 =?iso-8859-1?Q?LP2KNlnefIwGUrYrJF1O+nnhl3535g/ylYQoIQ5ikH0cB0stG7p/44k8Ne?=
 =?iso-8859-1?Q?0U9uvjBDMdGd4QPWTig+MiUs2iZQFs6fZ3wVVNNaZI/8JV6EAqigABsVba?=
 =?iso-8859-1?Q?hBIFFgxQjCFzBwgGnSXPdyH9FAHUaWLuhG5QPOc3Nzy5bQOGvgz9E9lfnX?=
 =?iso-8859-1?Q?G2LrJX1QDUULlgVSvkDIX+3P77d0bkGbULxi256SAiI6YRSgNpvM1TbndE?=
 =?iso-8859-1?Q?NJRlJFkKFBxbx66lZ2U/Cdt1V0UZeJJedzUvXap4WoPQqS3oqsyB6Y5kIO?=
 =?iso-8859-1?Q?usWLuwe41ejBcbkPTXXkMvxZ0dP/CFjhcJNgbApZ4CuC9hbQ3e075lUezW?=
 =?iso-8859-1?Q?gt6WU87BJgaFBwKfB6RGEAtU3cVhi1/JA+8HBkIygbvi+2tcfwy0A2nJ/R?=
 =?iso-8859-1?Q?4wBcQhb8ywJpU/DU4KNkTFHmYhKYfBNFeTwGN67bmEiZVQGwZdhixoZmdY?=
 =?iso-8859-1?Q?pTNJ2/9yOmlcATm963z7u/seMKhz2a8zsxvBC/r9HRsKyhYemUbqaM+2XN?=
 =?iso-8859-1?Q?VXmD6yIHy5t5i00xtMU9ezZuVzpzogcaXUAfkvuerJ4UAdHFzQGpQXI7o7?=
 =?iso-8859-1?Q?cwUWu8VT9ERYplGGUyb0BFuSljYvrJFT5xXLdNgjRodl6wJZLHj+6lEg15?=
 =?iso-8859-1?Q?WYCge9BwG+4PlB5D/h9dcgsCFvBA0EAiPy5+uphpyjL5jwur8NCXTOF/4x?=
 =?iso-8859-1?Q?2zDvJU9CgNt3Wzz3SRFG/A7R0PKMlMJk9Ng/IFFr0AU/YGzSmu8kNgYa6t?=
 =?iso-8859-1?Q?Q0c/ff/ehXSwBVbH7RqrA5iWTJDPGi9s6KvcafT3TmiXF6esPShO2ZlxZb?=
 =?iso-8859-1?Q?3Erxo7AQOcQHg8ymEwa12hBO64C1TjT+awsCEe7q69AINhkEg5gAMWpeW9?=
 =?iso-8859-1?Q?llnawaVe2O80sdjImQRdOd/7T7LxMLP2rL83UVxFiYlB7Xj+DK8JCPUDUh?=
 =?iso-8859-1?Q?YhtTKSlU+pMqG7HqbhE4ejm8UjIETVC8/3WtvO0PeIpg6HHXefDXGBvNi6?=
 =?iso-8859-1?Q?Tc84xiZiUy/qtiziG+t+bzq7dkTpC3n7zwJMtsouGV41KD8uw8tfy7TLrC?=
 =?iso-8859-1?Q?TyysHmuKGDvW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eGIZWeTJ34N35NfN813XktMtpG9omBgIUugOHQP06gJsP6zmOko4EPI2zt?=
 =?iso-8859-1?Q?XLk1fJkNc8W+kQ21G+3WvwyqZmPvKD43OUe1Tfb8dN76F6an2VKl2XAbId?=
 =?iso-8859-1?Q?gqD/rKM8YqcMuyMiRQ7adhKnPh8bpDiTRCS7J/dqW6bXgELhCQYfHGkt18?=
 =?iso-8859-1?Q?ZdAlnikjtjnxhMKeawwIumgCFkZxhA++EeNLTVT0BBcWzL87K6hrBtzXZv?=
 =?iso-8859-1?Q?t7sv/W6BQ0WsmHQI76sDo2wCk+AvcjSx/L1kqL8yF6tH6wXJaqpTaBWOaF?=
 =?iso-8859-1?Q?73P8BjfAiypdJqBLQQvZNkIJvpWHNB2S0Uwax/AfsleahXrqciB4Ha97ls?=
 =?iso-8859-1?Q?g2StUqmuA1D7IUDpkouRINrRtkexNpEUkhtBpUu9AhgQJwaIERQUFw9Mb2?=
 =?iso-8859-1?Q?1Q6hThzQEX5v0hU26RRjSv/kQ/z2wgqoAI0Wa07quQwfTuHOtrucT2Nca4?=
 =?iso-8859-1?Q?ZiPewe49M1UJ1XTN38ZgX6ib6BKUFYUcgEtCFi2KmcycDdSdgPuisI8DK5?=
 =?iso-8859-1?Q?lXBml4tyQpnc+UcwqmOELf8DyJCupDSWSrHfKjHoPwMiiY9Jn7O5GGyWNw?=
 =?iso-8859-1?Q?SvUYvtSniFAGMUKhGITWwB3BiAT6OrMW15oSrga5IwN7qJCnzCL6JP7o7w?=
 =?iso-8859-1?Q?8mHHP/n6FYjOD1J1yga6EMj5XBqJoxmues2KuFi/oBmZo276nf8ThVc2in?=
 =?iso-8859-1?Q?cYvCB8KIKzzNOL0hQiOx1nPotSnnSH4of4IaGlwF1bh21w9sA6GRdz7Ht/?=
 =?iso-8859-1?Q?c87gW1JXSXlMZJX+eC2pd8CiBDM1gG9WH3RLhaSdr+ZHz2R0r6xkanY0bF?=
 =?iso-8859-1?Q?i8RSuL/jNc10T3qBc63ZACzCk2CjwkYZ+b7eFfoeDmbE0wlZPzS/3cbqnl?=
 =?iso-8859-1?Q?w8M223VgbYUfPSPNwkjd39JMUCRWu7YDZev1VA0hXBy58YKFEprZJUTO9/?=
 =?iso-8859-1?Q?/wcr9GSaQt25wenOxch8TVwqXvNmKonTgZ3eCro8EKXFGE3ksDHdVT40We?=
 =?iso-8859-1?Q?lYGwu5zTkMR31+8Ailpj4P47b8X1NZAplXD87p9fBKZpHnZwUqGdzbJw2I?=
 =?iso-8859-1?Q?CAWwAioPSpBqfyeQfCctuaaZ1kH3p/UztfOqZLs7wDILBSbemA/ICyfEFC?=
 =?iso-8859-1?Q?/QrMj+rgFkq+zxkNL0nFX32cj/IPXHXV9XMBQUgh/awYu1SwPqpRoOQ8Be?=
 =?iso-8859-1?Q?FWJauJhArdzQAw5AXtssKeba1CZ2hRmmGVFo3y6bLfmjutKdEZO8CvYp3M?=
 =?iso-8859-1?Q?mVXEGVCHyJ/1cnfJMctEAjG59U3+cJbVnZH0t8YQWJ/Hrc1BzeNOkhK4j7?=
 =?iso-8859-1?Q?NNvs9fAAdvtK57N84Ru4B+oM2mwUuvV54RNoZP1cqOEmgpIFXsk377w7QS?=
 =?iso-8859-1?Q?jxQ3cYmaCsdf3ivCWgTGWd5StML6foByklkHBe62N+fvoVRBHm5xa2mmcT?=
 =?iso-8859-1?Q?wu4WOyhbiniFPu+7znC8QEWQVx3uGxsAneg9tgF/coVwLwOuHyIdGPIFz1?=
 =?iso-8859-1?Q?gSkYCJQWXjmitgWlNWyzbw/62ehqjtD30ER3804H+vJZs7VKAOeYqs08LN?=
 =?iso-8859-1?Q?wa07YW7aK52UxPoVHpu9nuScAIhobdyyoTUgCYTwcCBnInMxbPuR1LEOMO?=
 =?iso-8859-1?Q?YihJGwjeA/PlFtuF4UAnOGZRGfyHK5710aLy24cHTedNYXJ7P+CXwXjPZs?=
 =?iso-8859-1?Q?SECBr8w08bdK0HhKsQI5OSLFwdMIRzMLVgKxqSOnb3DG/kAV1UkrEEMtPc?=
 =?iso-8859-1?Q?/LX7xuFQT5OMWr/BeLErphYzMujLOEi9PDGe8y6SNrN0x4H4DvUtiEN8a7?=
 =?iso-8859-1?Q?cmA8KnqnYrpAw6hgNDhYuSQOQHMyGfU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gCw7dl8gyhVPXIA3XtFxKfI6r2CMBdfWwN1MznhLp+WjmxjvNOZW8R4V8ON0pBRxt97sk1FNWpDxPI1GPxnYBG1SFAU/LBn5/uGBMlwvGM5TYycIW4jHlGnu/lbdhgQujbkBSUUB9l6ibAcUJfK+kmI9pV1Ud2OpXPb8iAOKQAD0lG2qjIvtahOQwxBvEooy7ugqv43z5R4kzvWAaaxlZpKhKBwI/NUrCAgk+WUJ4KURIcmtyZONNr5mpQO7D2+LWqvzJgiTeq+irm3uyO4TR0KQDwoKcvR7YfB49Gm+qEe77qirTJkBlLEEvy8RTiGe7Ec75fQFUyUcBxwojzaMSoPkM8GYpN4fSzeqLAA+wzrFTO3OZ+ZnREuz/wsZax/Zc3jYkwv11HL6vtZObxOeqWDNV5asTqAWnj/fwLxUhj4iVABgbDkBaC37CxYM5HSECJCqUiuMyVU+wLqnIg9kh6vSCXlpz9YzSraBy2cOR+/uj4tgXDpejOoMBP1N4StiMHWIIyJkt4czd2ulGUgQqpJzpk6b4EaNEE2psya2Mv5T5PVlT3oobfS/qGmNzTFrXVP6GBPXU8yo19b1RlHdmjbwwxe24dherVtsHIPSZfg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c45be8-256b-4349-cb04-08de6eaff93d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:38:41.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcIdWYnM1wF5suoeeZ129EvXaBo2xwMUh9GmBu4FldUBri2IYRzc6yIcL3k4PSIAkyCMGbku7erZcpsCjgPGextyAIDhpBIkpGQtuLd5YRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180047
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0NyBTYWx0ZWRfX/c0LojL3g96g
 gRdvCcUfoXvCZ89jtKQ/psfZSTJga77vSWu/uiYAwiCYUwFNEoEaucONDSWxiUAI+8nMkW8QDl7
 bdEd4mbqvR2TZL/2Ckbza55vuImfqJSabhzO9nQ2T60Up2LLDsydH11xU/3ETuc2uZlFQXEnC1L
 MUwyoZDBAFr22CfQau4AGRSPTuimFfjr4ETJAdPunzndsr35Mcgf53sVlxmKL2rz51e6wUdbAlc
 u5E4JmWXkocxn/MJUM3KUqJ8WdHrk9VfatShZjP2fRyZpnPtBM2wB9RFUcLMROhQJTUjEBxdItJ
 sMioPc/F9i0c7JoyfUxskA7JGEE1YbwJHfMgcDZXxqIY+3Loe1JKRHsjydf9o+AkJalVWo+hs/K
 vjrsneTz7Zv1yzFQl433q2MPFQ44yVGJtUWYEYgWk+n/YM/i892f/kLSECQZdcQw98isL4o5xXo
 /5q6xFOPhYqNZzbsqNA==
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=69955065 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=7Wt5W3uo9psv5lAT2dEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: INTB0EU5fruXqk3ZkvoBhNdopj-haJ-f
X-Proofpoint-ORIG-GUID: INTB0EU5fruXqk3ZkvoBhNdopj-haJ-f

On Wed, Feb 18, 2026 at 12:07:09AM -0500, Kris Van Hees wrote:
> On Tue, Feb 17, 2026 at 03:44:05PM -0500, Eugene Loh wrote:
> > On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
> > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   Makefunctions | 2 ++
> > >   configure     | 2 ++
> > >   2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/Makefunctions b/Makefunctions
> > > index 15836dc3..1f308967 100644
> > > --- a/Makefunctions
> > > +++ b/Makefunctions
> > > @@ -52,7 +52,9 @@ endef
> > >   # Rule to build a C source file.
> > >   # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
> > > +ifndef WITHOUT_DEPENDENCIES
> > >   cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
> > > +endif
> > >   define cc-template
> > >   $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
> > > diff --git a/configure b/configure
> > > index 04c28369..fadac05e 100755
> > > --- a/configure
> > > +++ b/configure
> > > @@ -172,6 +172,8 @@ for option in "$@"; do
> > >           HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> > >           HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> > >           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> > > +        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
> > > +        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
> > 
> > Maybe add these earlier/higher?  Where the other write_make_var settings
> > are?
> 
> I think it makes more sense to have them at the end because they are not
> really common options that people would use.  They are being added because
> the GNU Coding Standards require them (and having them means that distro
> build systems that expect a standard configure script can pass typical
> options without complaints).
> 
> > Also, should these options be documented?  Like in the file's help()?
> 
> I'll add them to the help.
> 
> > (Come to think of it, how about --with-libctf and --with-libfuse3? Should
> > they also appear in --help?)
> 
> Should be done in a separate patch.

Actually, this is already part of the help output, by virtue of the 
help-overrides make target.

> > >           *) echo "Unknown option $option" >&2
> > >              exit 1;;
> > >       esac
