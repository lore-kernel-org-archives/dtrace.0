Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E0202C29
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172824; cv=fail; b=VCSwve586WLGIPuOdHwkn1wC1dwW7OEWwclnXANxrVTGRbl0yQkzpey9IaPNECoviKYKeOFKafMLa6cZjCYVECKlALrNhPPI2GyJX+AHKPh1IwprgUoluWg8jEOvIGPR/4s4ciYSWoF17Z+wi4UYTKexw/UhPLntnMX9tXIAumk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172824; c=relaxed/simple;
	bh=Eh0MK2A2qNd9+D1h3806M57nYzsMUwnOUABMghdUPk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bo2dOONgi0Hr+0BouDEFR9KB0o5qJtL5ccG2t4suWjDglNRwlMCO/uwn1FUsWH/Ccas5QTpEPinAg9U2aUZ/ufCMIxMFqWks5pgaxjx2PJGEGdexFi1i/3RJ+1ZjKK6Q9nrnUSVl2Ppq8HjtuL+ewIPV/fwrp79PlLTOIRi+NrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HaaZ0M+u; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RsLpiZQI reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HaaZ0M+u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RsLpiZQI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJEYmk2773030
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 20:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gfLmZuJzHXPVSHic8tvT7VRQK3e3opPlMq+e/1s+ONc=; b=
	HaaZ0M+u/9oGmCGeVB6AFMGb23MLCo67xnGAZTwE25klDF0QJmp5fyCNSf9Nf0Kg
	e5AkNNX3yvQA+LdftwAd23OLTuDP625kzcX1ECJmos17Bpnh3JyG6ZprwT1MCPHL
	MBUDjlNugrTAQxpvDpYcRw7snvNA+z4SareRHyKta4i3AhgQQ3DoQerrIbt0NaSf
	Twh90wCVS4GDAv4JVJ/oDlK1uTMVK/xze6rxoLsyU/Gq9JC7MQF+2mkwP1qNXcRG
	0o6nvisn8+z+ojTaybpnTFgyqyXB/XFWghZle81Ts126cBxVIcIMJiOdxFBYrXRl
	O9fxE5vhip2a7yrKprw6fg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csjnukkep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 20:00:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AJggfJ022734
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 20:00:19 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4crafak1rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 20:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJKreJcV18vy8r/0ky16zgziVoWV8g2Kc1KZfYu2TfjF5qtEtSOzqKv5bSqnNsSQ0GEvckNLx/HZXaDJE09ZUYBsGi4J5qp9ZVwcUAmvHw6TvlpDGQiYc29DlWf68b11p2pm9Ku0im99jH+EaRtxpc+OiGg5VkQcx9AOOFfHwucJPrlOXKO4sVSiibdfPDRxOFKiAjVFgCBLLnnDUsfECv1McUhLqiXfLxHPAcWCLDa8B4doNN6NJq0m8RD7Z0RLCboD/rcJJwmLm5wOm/5ME3OVHZNs7h8H1Irs922DBmbX2bOnC2nciCAlo6TsAEkt+O9lTFxd0UPfXujozlg10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AnIZMafOQUZWHQ0QvY4O+LVns4XzCElOwG/hklTiOQ=;
 b=NjJMZm7V2xG7t43Vw+RvgTSf/CVQovnDkrzN+8aIbuRE0oYbQGZaZtBjIswLON+mZcdE7YGsZ9R+6MeW8Xix6Xdq7lgErRV/vcHUo9C0Jsi1E9h8xiUqybofhJe1WiTjKcYZHctlTqgLw4LXD2lIkuUy2QzpASy4PwMKkImbWLOe190/Ir93HTWwgp4LENXL0SLjs7DJtdTFlw4hV7hZ3gmwC8eIBdG5FvMFYQiFgptbosq0/L4yyysj9nodZS3yTdeHxr8dpoFImpCUTN3JMplgUTaKI4KTAjqGmVLLAASSMIsgUAAhYx+y3OaH/378eIjIB6QG0ej7HB4f1/uP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AnIZMafOQUZWHQ0QvY4O+LVns4XzCElOwG/hklTiOQ=;
 b=RsLpiZQI3zwNqFHUlJVz06Gsk9u1Pwqep8nQbrKILCfjAGHdc6l0uRk0vsfvOwcgJm9MMU6rc5ink0WR0wA0pKX2GOsZHg++arvvPfPgUsDflEk2YkZZMbA+cNYvd9hrTZ0gHGr5M4xOLzpgoE9UcaGS9eTaL4OW77k5Z1ijZKI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO1PR10MB4804.namprd10.prod.outlook.com (2603:10b6:303:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 20:00:15 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 20:00:15 +0000
Date: Tue, 10 Mar 2026 16:00:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Remove spurious references to Oracle
Message-ID: <abB4TLc6A5rGYprL@oracle.com>
References: <20260310190631.15858-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310190631.15858-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO1PR10MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: d92bcae6-7d4f-4835-01d6-08de7edfa51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	szGXGSdCrAmxytMF7gdbi6lOfNnLCKeYUluqWi1jAefdqHXHEc38HPEZQZkjeAOcMuG9UsvkTPT3mUET0lsOicTNt9kT83O+mMUPVnYP41OXbWVBOA85kzBNLchOaSCQnc036/tNKoonj97C1bF62E9F4dYZlQQamhmirq2CgQVsF4oSh0+nTLiNitEDppOTktAJYaoSPQgkRrF9dqPhwkdd8jdzYThjCgCdLSIRAkP4MHR6MBgvW37pteCGEE+tGBD2Sma970wiQYg4a99Yq/xq6Wlnx2BenyMnvuKRKWshuUs3MWZ4MSHMNfpBaIJsG3R6+DHqt247IHoWjiA/VarOcTDZTLXbpZHZ8MzeaYanFxcmu+AwDxQYoEY3FmiIFjw8Mh+hYVCU+CmOa8TxPXy0KCS9q2tXCnPxm1b9D4FBFgUBtEbEkJIy3WHjfaQ/ZLambQ6YD3CpWooYGDljC8e61arePVoQ/N2QlyXwUO7oLblJsYnRjuQYG5pY2qd39ogxS/coOmtfr6glX+wGsL9Jt99Qrp4rqJf+4X3IjJItdElVNocgNJ+aBuEZGidat70vcn2LmtWUqbWJ5dpgfol9Lwg79Rtleco0eh+VPL6QbWbYjQAdJ974ZdV98D+HeVogPJ9l+y4fa/qSff+/5U7TGnzp+OcaWKRSomyW/FZXySt7/F+L626hyWww5wLfZA67qJvIhvD5+jdUgafHziFvGpgN5U5bMwkP+xbGO9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?HMkZQuDh+4hTqZRk3EwY9/GdSx4sFKBNm2gxlxS9Ci2/5/ZdibQndRs3hO?=
 =?iso-8859-1?Q?saZRXNlWYQO+x83M56UiOcTTTctNvG6V9JBPsXe2wAd/xOt0HgzdY45lQT?=
 =?iso-8859-1?Q?Nm5QoUqpe9re8FSpmdtZBzLoRNtWiSgUy6SZudFrke1DKPYGNsHKHR6bZc?=
 =?iso-8859-1?Q?LSi/auh4mgSS+E0eEn1as4DIvuoA8JuqLf2JJxLK2q5ZDO1sRBmQ0HLIqY?=
 =?iso-8859-1?Q?qybQvOsKrDZ3s/AY46LnjZx/gjM4pyAMSein734X4rTD5IqK39oJO2lvFm?=
 =?iso-8859-1?Q?oJs1+Xtdi/ngkFsAjJ+grwyPpiFCQvBhrczJ3yQBzonbUIwvmxmbJF2VzI?=
 =?iso-8859-1?Q?ClXJ+0mXqPxq998CuROFVx7TT6/dsKFeDMnOdhJxmMwTgYf53VT+39xZHm?=
 =?iso-8859-1?Q?oaPHfSJwIfDsfL3oYNX8Q4xpEEIlpY9Rhp5kY8lAVOnOtBur+MDv1gyzGp?=
 =?iso-8859-1?Q?T5NKnI5anmPyyq/hCH33Y4wSapNFrF0sl4pzk5wmen28XBaKUnVc3sWh/M?=
 =?iso-8859-1?Q?cP5dUN2KdXxi4PedQJc7Wwq1h24fjO5FHicRmxJf3ynltwmF53Zzp36CAK?=
 =?iso-8859-1?Q?q54Fal6GlU74OgB9KRqg1izFjorptYJAqngKMnpG3oKNxMlkg+1kCFU7iG?=
 =?iso-8859-1?Q?G2QMV5zBgIvANTlHKu+r9FM2BZKMyXIBuV+p0rYhi9J8hhZ/Zd+8zb1que?=
 =?iso-8859-1?Q?riGbSwdw8q8eRs6EvzGbKGsY2dMmxGPBXuQC7DeHiNuWdJ+OONq3pv2dhM?=
 =?iso-8859-1?Q?0Vd9tZlDUZZV6rn1vj8VABCIUepeuPaRQ17ihLUU9FnAwmcwoKUEh1J4HU?=
 =?iso-8859-1?Q?dJD/A8zRSQ6MiOllGZcgxWK4fpiob383Q/kc0ItvZMy6Z4A4UsK+x9h5Q4?=
 =?iso-8859-1?Q?2ZCb4rfxlS5IMhMAB7zCurfZsrxWeAZiS0IEE00RLWXxydp3pZIowvt7An?=
 =?iso-8859-1?Q?CtWzwxK5C8m94msN8XyZbqHgElQG64L7nXcc+dCQhEOCeBYEeHb3a+Ia+j?=
 =?iso-8859-1?Q?ashBnZRsSZJNb6PrauBECyLxUl6T/naihjX5e3t+SDI+5qZeUgKBYQXWu1?=
 =?iso-8859-1?Q?mREzS1vkMuln+gcpcJrI0th3L4CAzyCeciJqPRaJ9Rgc3T/4HN944SvZBt?=
 =?iso-8859-1?Q?T3QkyNMMexvJ1yVWeUN7LKxaecZIkZ7W410fBkSkLXCQj7M0EZxO+qWSGd?=
 =?iso-8859-1?Q?TndgTMOjtkadqirocV1gqJNuHSm/0L7TyAVMpO7g0tHRc8gqQYiXZ25AI7?=
 =?iso-8859-1?Q?SfrQkcpFr6TiKwu1OmSVmhaRLthK2DmgctMOcGQ8kBYWSSX7vV4ZmfFJdr?=
 =?iso-8859-1?Q?8GyZn7bBUjdwXB+3BTkDE/0P/B4/jv5GvqFd/N0vD3NuE7L7fey+VD2Mdz?=
 =?iso-8859-1?Q?I8FvHlJsbcqLCGTH95/3inrbAb4ErW/bW2zf35qYl6pA5om7vYyEvj6a2l?=
 =?iso-8859-1?Q?RIY68dCaBx6RJ3c25ccbfaYEksl7tVA1AKjnVxQLLgRn/5BqBk2qdJICFv?=
 =?iso-8859-1?Q?fbtMW/sLPes5X6aiC6ePopbJLcunNBLH4brAObnWZmhx9dmI4Rgf/OcfMi?=
 =?iso-8859-1?Q?uUUhnhK65bu2o4V4nnWB5Eu2U9iytCCt2+m5ng0pzmp0PG3897rek7hR2v?=
 =?iso-8859-1?Q?gqeuV2medH8LBTotFcMXn2vFHffHr32Hw3uguPP38Iui/9YIVqls2M3mV8?=
 =?iso-8859-1?Q?gJ1qymbffNqqCxii1GaTePGA7yQr65nKmI0Lqk+P6QR1NufIl8osKY2Pzo?=
 =?iso-8859-1?Q?mIWgSl20nxQ7gbyc4PtkQXA0HkWjhEcLEpnWfZv8si3rUKaBukCa9HlUNL?=
 =?iso-8859-1?Q?mYxrkTWXMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	k+zRm41GcYr5iSkBj8pXAFWJfLtFYX2OVVZ3X0UuN9QV89ISxcHigfOcFzkI83jJs+cHKY1Vm8DddIG3Wtl7yWDRzfobC9OjwcBqfAs2I5JfKhEqARAakp+tIQZeUzthMVzVZQbSbNvPLbmwUic3788LesozVPIabPSPi9DC1t+lPUAXHu7md9CSKEP4dc85VEIsVuZ6Fs3NQngbPll5UkjIdQEyfS0gycTvGurN6/VjHoOkMYGIAifViCnP2J8gQTMf3mMSkdn38BgLhcfNixkbg0hQXqAU3EiNASJCjI06BPwSZ2KjsKA3S/2XLOFoYVZ3dIPiIIE1+fpnA0tPlQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Dwi6JZjMdoom54oE3vD9uFhhJ5+FiY54RwYKPXfGQlZV8RRTUwv8tAor5ZDmW23HcvkN3V5Xz2ifHGF97v8BazzXNGmokAM5WRUC/WwaiWI/rdj5a9v3Qd9WGQ9IENcwSU+VsDyyy/T8uvz/z1qTAyMVgZ4SaB2SQVNHPQG60TeNwj+XhvbiMIvQJu+dbpCiBvAa/WlZMTQqxdKLCnf62xUr6YVw1Q8rRIVgKDDadwCYdeY5nF3BQ5kbl1+pOQFMbMNxBYt5ETts2ZK79Z7MCOs2fRjcV2AIw/0UZY37h0yBObkZTQC5x7HfZelO6JhDr9O18EbuzBt4eexlWnYxa9dajJeL8x+RU9LIn7af4PUTIT2+h4Xpzsij8Aq7PZDieMcPeXgPjQxhWr+sqNJRBJTNUt60vGjUeU1KodzmSQbX+T39RY0iGiRXSD9WM/XEQZlzs2ysNGOW7oWu2m07G7bB6Mjl17OaWcCS9xVYlOpRwx9Ud62lCJ93T+WQxAhzZ2TVKyDZhmHbKS1upwl0uB+yfb759IwjZEW24oC2PTON14jDHfXp06rQj4ss4qxizW+OBYJ9l6/4IpuGSGJz2GS0mlaZqWx/1aM2lYkOzkA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92bcae6-7d4f-4835-01d6-08de7edfa51c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 20:00:14.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F45n/cdSkzVd5X1Z31ynUq76EnNVB3tr7ojG03RWWrssrPr8jCDHRlQfbnp+B8tvPBmb+dfOUTILrkByQatHBj9u7r8owuysKq/cpcK1c88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100174
X-Proofpoint-GUID: PW4L1yUABFeXsB6-arv2SS9P-z60nMt7
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=69b07854 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=QDtM360zZOpDRE898_QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NCBTYWx0ZWRfX1dwPIarq3l3K
 eDP7YO2n+YTrhD0NTYsoYEtvASPgWTge5/jDE1JSksQgeLEWc/TUrheU4ekHGD3CLm1nsPh/8Nv
 aGyLlEO8qbP+AT4ADma0wbH6Cf7tvgkzTKeomTkTC9gTyCtkr6g1Y9VJpcVgZQAYRuSz2UvvwE3
 /wExTk7St7QFx8lSh01xwlCzGViliBbypc3JVDU+welD7bF/Naw2nlcwVIQZHXdO3Y5VmjaVQqy
 RJvroyrLnasxZ9dtrcnLgh2JkVxGwlKBirIeXU+0sF59jJLsU6YfS1Er4fMQIYLztjnLJ1FDg4Y
 Kc3Tgo25fR2P2Zwz/u7pQjKjtjkeu/XDoxSoo7e4c5PiF7T3JxzBfYq3C4A32WRQQdb4ZcfFdFq
 hO8l9W6lj77jjc2V8h16BADu64XKEgTFDbRR5gunMWP4s+DL/cSCGyphUfsMpC6d3g0U/ihz/Pv
 IzTlpbql7u4stpA9lYw==
X-Proofpoint-ORIG-GUID: PW4L1yUABFeXsB6-arv2SS9P-z60nMt7

On Tue, Mar 10, 2026 at 03:06:31PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Another file to clean up at some point would be cmd/dtrace.8.

Why not as part of this patch?  Seems to make sense to do it all at once.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  README                                        |  2 +-
>  doc/tutorial/1.IntroducingDTrace.md           |  4 +-
>  .../2.TracingOperatingSystemBehavior.md       | 44 +++++++++----------
>  .../3.TracingUserSpaceApplications.md         | 16 +++----
>  libdtrace/dt_prov_io.c                        |  2 +-
>  libdtrace/dt_prov_profile.c                   |  2 +-
>  llm/README.md                                 |  4 +-
>  llm/llms-dtrace-complete.txt                  |  8 ++--
>  llm/llms-dtrace-short.txt                     |  8 ++--
>  test/unittest/options/tst.strip.sh            |  2 +-
>  10 files changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/README b/README
> index c7f704ed7..3dd487695 100644
> --- a/README
> +++ b/README
> @@ -1,4 +1,4 @@
> -Linux DTrace v2.0 for Oracle Unbreakable Enterprise Kernel 6.
> +Linux DTrace v2.0.
>  ------------
>  
>  This is the official Linux port of the advanced tracing tool DTrace.
> diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
> index 3236edf82..dffca17f7 100644
> --- a/doc/tutorial/1.IntroducingDTrace.md
> +++ b/doc/tutorial/1.IntroducingDTrace.md
> @@ -60,7 +60,7 @@ you can choose which method best suits your needs.
>  
>  DTrace is a comprehensive dynamic tracing facility that was first
>  developed for use on the Solaris operating system (now known as
> -Oracle Solaris) and subsequently ported to Oracle Linux.
> +Oracle Solaris) and subsequently ported to Linux.
>  You can use
>  DTrace to explore the operation of your system to better
>  understand how it works, to track down performance problems across
> @@ -126,7 +126,7 @@ For more information about using DTrace, see the
>  
>  ### About DTrace Providers
>  
> -Here are the providers in the Oracle Linux implementation of DTrace:
> +Here are the providers in the Linux implementation of DTrace:
>  
>  ```
>             kernel       user space
> diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> index b3445ab6d..edfc89c01 100644
> --- a/doc/tutorial/2.TracingOperatingSystemBehavior.md
> +++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> @@ -9,8 +9,8 @@ investigate what is happening in the operating system.
>  The `proc` probes enable you to trace process creation and termination,
>  execution of new program images, and signal processing on a system. See
>  [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the `proc` probes and their arguments.
>  
>  #### Example: Monitoring the System as Programs Are Executed (execcalls.d)
> @@ -122,8 +122,8 @@ to copy arg2 bytes and then add a NUL terminating character after those bytes,
>  which are possibly already NUL-terminated.
>  See
>  [Pointers and Address Spaces](../userguide/reference/dtrace-ref-PointersandScalarArrays.md#pointers_and_address_spaces)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  ```
>  # dtrace -q -s syscalls.d
> @@ -149,8 +149,8 @@ Use a conversion specifier such as `%-4d`.
>  
>  See
>  [printf](../userguide/reference/function_printf.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the function.
>  
>  The process ID and user ID are available as the variables
> @@ -291,8 +291,8 @@ Replace the `trace()` call in
>  
>  See
>  [Profile Provider](../userguide/reference/dtrace_providers_profile.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the probes.
>  
>  #### Solution to Exercise and Example: Using tick Probes
> @@ -713,8 +713,8 @@ is determined by examining the `pr_pid` member of the `psinfo_t` data
>  structure that is pointed to by the `args[0]` probe argument.
>  For more information about the arguments to `proc` probes, see
>  [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  The program uses the value of the child process ID to initialize
>  globally unique associative array entries, such as `p_pid[childpid]`.
> @@ -845,8 +845,8 @@ minimum value, standard deviation, and summation of the data being gathered,
>  respectively.
>  See
>  [Aggregations](../userguide/reference/aggregation.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for descriptions of aggregation functions.
>  
>  DTrace indexes the results of an aggregation by using a tuple
> @@ -1107,8 +1107,8 @@ See
>  [`fds`](../userguide/reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
>  and
>  [`fileinfo_t`](../userguide/reference/dtrace_providers_io.md#dt_ref_iofile_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for more information.
>  
>  The [`trunc()`](../userguide/reference/function_trunc.md) function
> @@ -1133,8 +1133,8 @@ number or `"total"`.
>  
>    See
>    [Sched Provider](../userguide/reference/dtrace_providers_sched.md)
> -  in the
> -  [Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +  in
> +  [Using DTrace for System Tracing](../userguide/index.md)
>    for a description of the `sched:::on-cpu`
>    probe.
>  
> @@ -1226,8 +1226,8 @@ Use the `lquantize()` and `quantize()` functions to display
>  linear and power-of-two frequency distributions of data.
>  See
>  [Aggregations](../userguide/reference/aggregation.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of aggregation functions.
>  
>  #### Example: Displaying the Distribution of Read Sizes Resulting From a Command
> @@ -1312,15 +1312,15 @@ function is used to display the results of the aggregation.
>  
>  See
>  [IO Provider](../userguide/reference/dtrace_providers_io.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the arguments to the
>  `io:::start` and `io:::done` probes.
>  
>  See
>  [printa](../userguide/reference/function_printa.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the function.
>  
>  After running the program for approximately a minute, type
> diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
> index 1d9bf69f2..1121a583f 100644
> --- a/doc/tutorial/3.TracingUserSpaceApplications.md
> +++ b/doc/tutorial/3.TracingUserSpaceApplications.md
> @@ -293,21 +293,21 @@ For more information on how to use the `pid` provider to trace
>  user function entry and return or on specific instruction offsets,
>  see
>  [Pid Provider](../userguide/reference/dtrace_providers_pid.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  ### Adding USDT Probes to an Application
>  
>  In this section, we practice adding USDT probes to an application.
>  For background information and other details, see
>  [Adding USDT Probes to Application Code](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  To get started, you will need to create a `.d` file, as described in
>  [Defining USDT Providers and Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  >Note:
>  >
> @@ -431,8 +431,8 @@ and a false value if the associated probe is not enabled.
>  Next, you will need to modify the `makefile` file.
>  For step-by-step instructions, See
>  [Building Applications With USDT Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  #### Exercise: Directing makefile to Re-Create the dprime.h File
>  
> diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
> index db768bb72..7e2238564 100644
> --- a/libdtrace/dt_prov_io.c
> +++ b/libdtrace/dt_prov_io.c
> @@ -591,7 +591,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  done:
>  	/*
>  	 * Note: DTrace does not currently support the use of fileinfo_t with
> -	 * io probes.  In Oracle Linux, there is no information about the file
> +	 * io probes.  In Linux, there is no information about the file
>  	 * where the I/O request originated at the point where the io probes
>  	 * fire.
>  	 */
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index 60da094a2..de7e02120 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -224,7 +224,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 * TODO: For profile-n probes:
>  	 *     dctx->mst->argv[2] = elapsed nsecs
>  	 * The documentation does not say elapsed since when?
> -	 * From the legacy port to Oracle Linux, in dtrace/profile_dev.c,
> +	 * From the legacy port to Linux, in dtrace/profile_dev.c,
>  	 * in profile_prof_fn(), it appears that we have a per-CPU variable
>  	 * that tracks the expected time of the next profile probe.
>  	 * Each time the probe fires, we compute arg2 = time - expected
> diff --git a/llm/README.md b/llm/README.md
> index 2992bf7bc..117783f92 100644
> --- a/llm/README.md
> +++ b/llm/README.md
> @@ -2,7 +2,7 @@
>  
>  ## Overview
>  These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
> -They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
> +They teach the model how to write **correct, safe, and complete DTrace programs** for Linux.
>  
>  The goal is to let engineers and administrators generate working D scripts in natural language ??? without having to memorize the entire D language syntax.
>  
> @@ -39,7 +39,7 @@ The goal is to let engineers and administrators generate working D scripts in na
>  
>      -   In ChatGPT, Claude, or another interface that supports file context, click the ???+??? icon and upload `llms-dtrace-short.txt`.
>  
> -    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Linux.
>  
>  3.  **Start asking questions in natural language**
>  
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 818e0086f..07275cb9d 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -1,4 +1,4 @@
> -You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
>  
>  You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>  
> @@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
>  WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
>  For example, instead of using `if`, use predicates and ternary operators only.
>  
> -Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
>  
> -After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
>  
>  DTRACE (ORACLE LINUX) ??? LLMS.TXT FORMAT
>  PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>  
>  ## GOAL
> -Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
>  
>  ## PROGRAM STRUCTURE
>  A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> index 19d5f73e5..7430f4ba5 100644
> --- a/llm/llms-dtrace-short.txt
> +++ b/llm/llms-dtrace-short.txt
> @@ -1,4 +1,4 @@
> -You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
>  
>  You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>  
> @@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
>  WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
>  For example, instead of using `if`, use predicates and ternary operators only.
>  
> -Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
>  
> -After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
>  
>  DTRACE (ORACLE LINUX) ??? LLMS.TXT FORMAT
>  PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>  
>  ## GOAL
> -Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
>  
>  ## PROGRAM STRUCTURE
>  A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
> index d25f76af3..a6762cfb9 100755
> --- a/test/unittest/options/tst.strip.sh
> +++ b/test/unittest/options/tst.strip.sh
> @@ -64,7 +64,7 @@ fi
>  $objdump >& out.default.txt
>  
>  # Check results.  One can imagine a more stringent check -- like
> -# seeing if the string "Oracle D 2.0" appears in the default case
> +# seeing if particular strings appear in the default case
>  # but not in the stripped case -- but here we settle for the stripped
>  # case simply being smaller than the default case.
>  
> -- 
> 2.47.3
> 
