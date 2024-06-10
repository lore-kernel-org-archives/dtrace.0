Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12117545
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718052943; cv=fail; b=dan3PswdwTo20Nz5uVIDrG7Otb2EPVX1O/4yPdlZAKgT8RzJQM+gWR25dcJLwLUfbsBHxwMFALYG38ZUnaDr9v/7Z8DzU2BBRl3nCikAjktMiBnqyL2U4hgJR9XjbDhSKIuiG8cl1WEjDUyRI12kviQ7D9Sd21ZvsN5+vtf0Ylk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718052943; c=relaxed/simple;
	bh=nN22NcpmUWuXkzIku+0xihmW+/lGNIHGdTrPUbiP8k0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q+J+Ng/wRNSHv9I1CDP57zpSgn3Qpd7PHb50aunnUNEFcVcpV7u0tnuUjnmT1teObhxmhZuuLJXdfRgNGSgkmkXECZQdg1EN/WqGVmCYwBDxZr06vIycIhtvSHLmbSo0zq5DbyEqJF+I1sFqY8+ItVTDpzXzfxVqtQPgDqNRXMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OFOyS+Hd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U1Y2rvxA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OFOyS+Hd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U1Y2rvxA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEMTgP010939
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 20:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=+15Zf2Xx2OnZZAxhlhP7JMZjX+ciUhqrJvu9i/Mmx1U=; b=
	OFOyS+HdA1ZcZvdCQEDoTigefhoRvby/zoJf7c1H5HohkgYsF+MEPJMFEk3wZs9U
	LIOj8Mkgktwdxb4c8k0C1QogzOxRHUegNRiBKbHnNuWngYxcl5rmapXhrCGrUvgi
	ysODTd7jwXPTRARYubIOjlZwVQBx8eZU4eEow79qXW9Yjzb1fG9kl48Vks+89tQZ
	212+30+/z7hgAXEXHY70lfRFzler5gZPYUaATQlzpHF5LYtSg+U3GlfHQ0FhRwMY
	1lo564xYhQnSgJepDfYkooQTD56+Yy05shNF93XatFEAnOIaBl8mR/1ZI577KZS6
	ZvL3W/LIiE3ihdSES9wOfQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh3p3gv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 20:55:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45AKl2P0020494
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 20:55:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yncatkgcf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 20:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIf0NlMOOPH4YkaTZbNtm1apNv+XZrM4m6LXxj/ddGIzVMCyRWofDheoz/kYeNqLj0V7LdLrtkHmv37r5u+NRCRNywXiPCH/Ea3nFz+k5+zxzN/lvJlp5B4/J7T8PCiybGGgS5o75ksKN6WFZ+fRfi3BFOt7NqMleZCQ+EZmoh+cpdWmyOWcqeb5nW0pJDK8h7cDBGJYODmFLwswEw8ZkOZcJwon4okdbKfj4ZEnQSfMZoXaavvYVdMAaqL6newXNAm8HRL9O80d13NQ+ICOHArU9TF73wWznEcTcW8pZfgoax+pEj3exjOV8namQOgxdSZXM3r60Epd+HKKNUHKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+15Zf2Xx2OnZZAxhlhP7JMZjX+ciUhqrJvu9i/Mmx1U=;
 b=SWWmfSw2Q3LL+FFsMjtp7d8trC1zQ3MspI9m3cumCBwcd5z1/eJ2OmHeuwmI46TQhpyI1jKGIggeJsYaSvUnzEzsIL/WWB2CQVSfDzOA9hMkLuLVpPiWjo5yk0Z/eO2SJ0g7J334tTEbrOECXTXEFBbP4m/abgUdVUtgHrGT5p2am+37V9CBwZ3kFkv+DOPbDZRIWeJNu5F0gE6HfuIRzRK0LcpsqFwWiebivDhxWLcjJSbbOAGE349aXHCn6c74RueR0Fi56gTh0xAzt5IkbkRWDRKK6unRNxWbX1uGvBXvWsOAFQCJRNCk5MWx8N5gwDmX6grIrRn9FCBlhgyDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+15Zf2Xx2OnZZAxhlhP7JMZjX+ciUhqrJvu9i/Mmx1U=;
 b=U1Y2rvxAfbw7f6o+Tz5MABW+TzicVu+YGdLpFtephF50kIrf/Wq/u+0jGuyfrAvnKh0+D16paMgCJLpcFbNeCPXgRc9nsgXvSIGHyIYT6p36FSBJAHgWGREvrov8N9kZLGmWkJRi3+MxjH8487UnnyWET5bFfGay4TnCosKx67s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4257.namprd10.prod.outlook.com (2603:10b6:a03:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 20:55:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Mon, 10 Jun 2024
 20:55:35 +0000
Message-ID: <7b5cf8f7-c045-31c1-e593-a14a732fb21f@oracle.com>
Date: Mon, 10 Jun 2024 16:55:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 07/14] Create the BPF uprobes map
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-8-eugene.loh@oracle.com> <Zl/qjYKgVWdU5Ys8@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zl/qjYKgVWdU5Ys8@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 928007b4-106b-4e7a-26d6-08dc898fad1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGpSZ1J2dzg5cnJUZEdtenpSMm1ITFFVbnlqRHpjRkt2ZHhjOEhOdjJNenAw?=
 =?utf-8?B?MGxibDVzRFJnZm8wUlB6SUFJdG4rUVlLbGNVRnQwTjRDdW1VRDBVazNLTHZW?=
 =?utf-8?B?dHVISVN3Wi9WN2FVQkE1TnY5c1FBUXJKcDBRbVUwTDg1dkJXRG1YejdjQ3dT?=
 =?utf-8?B?SU1XcGUzUDN2RnI5RERueDBGRjNXSFZXRzQyanhTeGRxb0FDaDgvUG9OU1Z6?=
 =?utf-8?B?QVhOREtKYVpCM3VDZU4yQnRiQlNUZy9DL2pyaHp5cUtFRkhrSlY2c2FPeC9i?=
 =?utf-8?B?M1lXU1hnREM0T3ZleG8wRU9zSDRmeGtzci9wQ3IwOTgxME1OTHpPMzQ1dUs4?=
 =?utf-8?B?bVlXT0dPeVhkdmszUkJ4RWtPWlkvUkRMQitLa3JNZUlianhBbFlLQ0RYOXds?=
 =?utf-8?B?Y2gzcGdsSlRRZ2MxWm8rcXlTY0hnT2Q1WWMwZExZdmhiY1ZWVmpBRnZFdE4y?=
 =?utf-8?B?QUN6aDVsSnIvNzNlaGZiWG83R2tVUzErZW5VUDY3emFwTEpiMUN5S3hWY0w0?=
 =?utf-8?B?MXhBdWdoQ0FMMWlJRFpFeGYvNEhoemxleElMMk4vUVNLamNTNUttQUNrSGlK?=
 =?utf-8?B?S2tsVmRHbERTcktTRVljcE80WjVtYmdLWUZvNENvZ2pyZzNwTnBlU3F4NlBJ?=
 =?utf-8?B?MVBqUXB1aEoyaWtaSUU1VVY5UzFYd2w0MlFtL2lScjhxOUdQSTVsbm9RczZk?=
 =?utf-8?B?d0FTQU1vRTYxRkdGMHZWN1RxcngyRjNlNjkwOSs5K3JCcmJoZ3h2eDMvdlMz?=
 =?utf-8?B?dGg2c09vZUd1OWd5RGh6QmNyQnUxRmNTMTYrYlI2ODFQVGl3VnB1MFlNZTRP?=
 =?utf-8?B?NjBGaXBMV0VlT2w2MEhML2pDU29hdEk2UnRidmV2dWRhN2xYdXpvb3l2ZkFY?=
 =?utf-8?B?akVXQk5OaEtPY0dQaGg1V05iTkFsb0VZVVladStXWE9UL0U0RXhTaEVJNWh3?=
 =?utf-8?B?djVRM044R0VBOG5QUExuRzFjbFRJNmJ2dXEvQ3JySk1pMGU4TUZDcytrRXY1?=
 =?utf-8?B?YmVrM25vaWQzQ0tCR01iWFc1YmJzOTQrdC9hekRJaVVGNGJOMHFMUkJQV0RZ?=
 =?utf-8?B?VyszVjgzYUh0R2dWTW1TVS95dlg4ODNnVkUxM20vM1ZtTko2VkEvZEFuSkFH?=
 =?utf-8?B?QVM2SVFpNk94eCs4czFQNElzbXZDQWt0U0FlUytSSFEwL3BWU1BxOGZKdFdx?=
 =?utf-8?B?S05ma3oycHZVT3hMYlhnZlRROGVYdnZaMzhBcUxYejVYdTgyTXRHZ2pYZnhx?=
 =?utf-8?B?cGtpcUVRYnFvTnJHU0ZwTGVFWGthaVB3ODFlNm4xaXFMQ2trandoSkswKzVS?=
 =?utf-8?B?RnZBYVBMek1qTVBpT3o5aVBZTnMvS0VNR2F1dEZBWE5WTVI3cDdydFIzZ2xi?=
 =?utf-8?B?eERvQkZ0RW5BcUR0dnVsbWs5NUxkbDJocEdlYndXUG5ZMDg4aXN3VGNaU0o3?=
 =?utf-8?B?K0RKbDV2ODRFeEpVbkpKeE1NNHpZOENQWXFZd3FGM2pkNHBRRy9TZU8yWUtk?=
 =?utf-8?B?TXVxNVoxVEtKT3g5SUN6aHdpenQ2Wnl0RFFlMzRPUHJiVFlnaGszdWpzNDhk?=
 =?utf-8?B?R1VKM2c1TE1iQTNOTHVtSEl1Y0YwM3ZpVE05eC9wTXpCWTIrMEN2SUVGMnFJ?=
 =?utf-8?B?c1dMZTNOTmsrZWFDdGczbTYwS2Y2YW9yUnQ0Zy9NcUpaby9PbHhkRWlkNUpv?=
 =?utf-8?B?QnhuTnVMNk03OERFT3Z6YlhoZ25vanRUU2k4VmlHS2FZdzB5OEZjbGNJVVpW?=
 =?utf-8?Q?6UipAr0S3GQCp/09NmfU3IdTJDgxXZ7bXhEVZ4v?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjkvYU5jMXppNmdMU0VRdVVtVWFJWm1vNUtTelpFU1M1eVhIckpnWVZoMVFB?=
 =?utf-8?B?VjFBbmdRMlBNclIxT20xZE9JdHM0b0RQNWxmOTE3V3pHYnBaT2x1bnRSNmln?=
 =?utf-8?B?T1VLK0huR3l6T1I3VHYyMStRQ1BSNUtuZ0ZtUkN0TjdSUDlydXZPMVNpc2FS?=
 =?utf-8?B?Nlp2OFhIcVIxczAzaElXRW9ZMkV5bDZXNFF3RDdLOXJ0VlZXeFdVMy9wQUZM?=
 =?utf-8?B?KzdiOE1YRDBORFBiRmhJbFRxV0VlNlJGaWhYbW8zNVVVSmtwanJNbW1odHdG?=
 =?utf-8?B?aGE5RmNxTEYveG4rSFIwQ1FCM21EN3lOVDcycnBaRmZuU3BaUm9aVHFUcUFJ?=
 =?utf-8?B?emQxWHprY2VtNjFkc1kwTm1SZFZ1K3VTelRoQ25KTjFRTEFLMU5aeFNCenJJ?=
 =?utf-8?B?M01pS0NBS3lDTWdNTFNEQjRUMzlaUlRUYVU3OFlVSUgzaktPK2hPSlJnV0ln?=
 =?utf-8?B?NHZlMm5jTm1jdFl0bllPYVJ5NGNpZVVmcy9oK1loVjJWeTQwNWY2SERZb0hm?=
 =?utf-8?B?MUc3Q3ViKzRMLy9Jd0QwWWJhL3Z4UlhndGpwSVNBVTNuUGt1d3ZTNjRFSmVS?=
 =?utf-8?B?Nk5lQnFyRVdDc1VUbTBFL0tndUFMVWhXeGpvb3FJZUxJWUE2ZGFodC9TNkpp?=
 =?utf-8?B?M0hKK2dxdElJRklCYWJxNnJPTHExMjIrMWQ4VlNkWlFMU1NBcUtUdVFqeDhr?=
 =?utf-8?B?ai9rSEZhTmp4Mm54L3laU3dlMW11UnE2SXVMbEcvVVdJVzBRbWRkdU5Oempj?=
 =?utf-8?B?ekxPbTltbzFoVHljOGFGYzYxeWM0NVByeVp4aFZzTUpBcXZGMDVQNG9BMklm?=
 =?utf-8?B?cURScm45NnpVaGZqc2N0ZExWOUdOTW42TW1US0xhYzByZFZhS3Q2emFLSVlB?=
 =?utf-8?B?VlcwL01qcDE5d01iREtCRXIvL3hSNU5McE9WWEZWODRkUVQra0g4YW1RR3hJ?=
 =?utf-8?B?ellLN0o0TXlOclJKeFBwVUZXdnh1SHZsT05CNlNrQkxUZ3Y5VnN4K0hHT2Nl?=
 =?utf-8?B?Znk5TDJDNm1GV1BySUlLcHlNVHhVRTEwdHJHd0doKzVGOVlwUm0yVW55SjBj?=
 =?utf-8?B?d0hsZTlOL29aWmxoSEZpNUNiSlFNSmlVS0FOa1h0SnQvcnU4bmFoekdJeTdn?=
 =?utf-8?B?cWJzSlVGYmRIakZVMU1wY2dSTmVCTnNzT3RKRWpMV1dSakdnQnZwOGYxV0c1?=
 =?utf-8?B?SWZha2l4NnU4U0xvWFBPUXMzVXNXUHJuMTFLYVFxU3hBSXlSMHJNeUVvWlpy?=
 =?utf-8?B?NHl3U1hzTVlwMTRYS2w2eE1yK2xWYXZ3NW1ITG15aGk4b1hkUWgvQ3p3aExr?=
 =?utf-8?B?czJtbmg5Wm5GNFB6eHE0d0hQTVRaNU01L09pNFg1UUFFMkp0VUFxRmIwRlRT?=
 =?utf-8?B?dmVFV1JhN0pNek9xRHZBY1NYcExibjZOTUhLbjR2WFFxMFBISHhBLzlMc3JO?=
 =?utf-8?B?dnp5K1dtTm5WOXg3NkNWZ3lVdjZvcFpoQzZKV0FWVnlVdUxpZjB6WWFHQ2tW?=
 =?utf-8?B?Zk51VWpEaHBUbEtsMkVRM2pDdVNrcUZpeFNXN0tVc2JISTZLWjJMcEwzSHBQ?=
 =?utf-8?B?ODRlRDRzcEpwbCt2c2wxWVhLY0FST1NFdWE3RjcxTmg5MWlUU0xzOHBqUENS?=
 =?utf-8?B?L3h2Q1IwOVVrWWdrTU5NNDZ6RmIwbGtiYVFjbVRHd2JuNEQvQkN0cVNibmM1?=
 =?utf-8?B?V21ab1ljdVl6MkVyTk1kZ0g2SHhpYnNCV3N6Mk1QcTlTOWlPVW1hYi9rTWpK?=
 =?utf-8?B?cE5MTXEzc25qdElrU2U2dFdpbzJCT3YxK2tkSks0V3FiM1lGbjdKSHRWUHJt?=
 =?utf-8?B?d2JpYWk1Z3hOZDdpbkIzTVh3dXhGRXV2a3Nwdlc3VWwzWENqWXFiUjJqMm1i?=
 =?utf-8?B?OS9iZ3AxWnZYS1B5bUJ0MXhjdzRYVGtXNDgzRE1NQlZrdk1vVHhNOUV3ZW5q?=
 =?utf-8?B?SnZDWHV0MGQzS2EyUjIrcWpuZlZ1RmFhTENJaDUzTWxkczlLQjM4dXRNNXZE?=
 =?utf-8?B?MnVCQWZWb3llN3c2bTA5SmJUSUJHcEV4eTVneEFFdWUrTi9Hc2wzRTBkdFd1?=
 =?utf-8?B?M09MVkx5NW55R3owN3RWeUNwWGFWdUJlKzlvMW9WSDd1UEpXWVo0L0RUUndv?=
 =?utf-8?Q?5XpZB63Q3hV7m/afQBMSYbPiR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7y6KYZzO8xEXVPCudW9SpDSvrcWm6FEwmP52HCdwpOqx/cJJtY+TwowT7Nvjk/XKyO8VK8CYtpnNGOARboP/CLgYY8TEPJiYgVDhW0CD88ITHzRyYv98VU1ETatKjNQ51P8iViglO/dHvTKjz4C/I5N7Xtqyosavk+jmcnaROdkawk6cxaoyEazFJ+R2DDJFeupKIRDMeFKGa4vZdAAMcGcqeTS1E11z+vOyIDX/VjRz9EpCn9MBjAKVyVpAOgJ+wAqJZiWy8YTagnn//enNecZsyofl7sn4LrEW2nTp/6GNVTUgRUgBU/UJeoGrNqUgealDpACJgShnI677HCyxspE7T8xQA79OtFWSkDzdrHYSQN9vgSATrPOx+34E8WBXjrOpeiXIMMyDjGnxuJxKUG5QBZ3rTzi3NN1gnQT8QsHp9CaEbY6SSpzL3RAH00pXlLqBnshsRb6G5prvpmZBAzsaK/w882KhtcOcClUzYXpuKXGmNKCZyH+6CELX1sUY+UPoTbPcPjij9+QyaqF9ZGKdxofXTmQOlrXav7/RWG0Dk3a9MBzNMYJsSjAiRtOxKs6XW+kBzflPz6S9r5Q2aM8Qv3Ez8ZhjTVtF3rSU/ig=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928007b4-106b-4e7a-26d6-08dc898fad1d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 20:55:35.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDF25f9Kk8ePqyIzAnBIZcNITbwHJ8+XM8PSmDRHIm/76SeZ6OdJhvXdTfhzOS7k2kww+61etuGJBWm87LYdQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4257
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100156
X-Proofpoint-GUID: vpv3CzAEor_OxgsKjdpQtRqdyPpZyQ5t
X-Proofpoint-ORIG-GUID: vpv3CzAEor_OxgsKjdpQtRqdyPpZyQ5t

On 6/5/24 00:33, Kris Van Hees wrote:

> On Tue, Jun 04, 2024 at 02:11:06PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> WIP, sizing is hardwired for now.
>> WIP, should add new pids and purge old ones (after the initial call).
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_bpf.c         | 48 +++++++++++++++++++++++++++++++
>>   libdtrace/dt_dlibs.c       |  1 +
>>   libdtrace/dt_impl.h        |  1 +
>>   libdtrace/dt_prov_uprobe.c | 59 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 109 insertions(+)
>>
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 71c6a446..3aeae274 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -946,6 +946,53 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>>   	return 0;
>>   }
>>   
>> +/* also defined in dt_prov_uprobe.c */
> This is a red flag - why would structures be defined in two different places?
> That certainly risks really bad situations where one gets changed and not the
> other.  Why is there duplication?  That should never happen.

Sure.  To be fair, such egregious coding is not (unfortunately) 
unprecedented.  Also, there is a comment in each location warning of the 
other location.  But, yeah, the situation is not ideal.  It was a 
placeholder awaiting a better solution.

One option is maybe to define these structs only in 
libdtrace/dt_prov_uprobe.c.  Then, have dtrace_hdl_t include (near the 
map fd) two other components:  one for the key size and one for the 
value size.  When we call the uprobe provider's populate() function, we 
can set these sizes.  Later, when we create the BPF map, we can retrieve 
the sizes.  It would mean that dtrace_hdl_t has some provider-specific 
components, but I guess that line has already been crossed by having 
dt_prov_pid and dt_prov_usdt.

What do you think?  Do two such new "BPF map key and value size" 
components to dtrace_hdl_t seem reasonable?

>> +typedef struct uprobe_map_key {
>> +	pid_t		pid;
>> +	dtrace_id_t	uprid;
>> +} uprobe_map_key_t;
>> +typedef struct uprobe_map_val {
>> +	dtrace_id_t	prid;
>> +	long long	mask;
>> +} uprobe_map_val_t;
>> +
>> +/*
>> + * Create the 'uprobes' BPF map.
> How about naming it 'prmap' or something like that?  Or 'pidmap'?  It has more
> to do with pids than with uprobes.  (And then rename the struct names also,
> and everything else that is currently based on the uprobes map name.)

I don't get this.  The map seems specific to uprobes.  The pid enters 
only as a component of the key;  the other component is the uprobe.  To 
me, the map is less about pids than about uprobes, even if it is 
somewhat related to both.

>> + *
>> + * Uprobe information map.  This is a global hash map for use
>> + * with USDT and pid probes).  It is indexed by (pid, probe ID),
>> + * using the probe ID of the underlying probe.  The value is a
>> + * probe ID for the overlying probe and a bit mask indicating
>> + * which clauses to execute for this pid.
>> + *
>> + * WIP.  Just make up some sizes for now.
>> + *
>> + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
>> + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
>> + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
>> + *     So either uint32_t or dtrace_id_t is fine.
>> + *
>> + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
>> + *
>> + *     How many entries should we allow?  Start with 1000.
>> + *
>> + * FIXME:  is there any way two different overlying probes (differing by more
>> + * than just pid) could map to the same underlying probe?
> I expect it ought to be possible to place a pid offset probe on the location of
> a USDT probe, thereby causing two overlying probes on the same underlying one.

Good point.  Yeah, I confirmed this with legacy DTrace.  I set a USDT 
probe and pid probe to fire at the same place.  Each one reports its 
uregs[R_PC].  Both fire.  Both report the same PC.

But this doesn't work with DTrace on eBPF.  I can set a USDT probe. I 
can alternatively set a pid probe at that offset.  But if I try to set 
both probes at once, only one of them will fire.  Presumably this is 
because the uprobe trampoline, having matched on one overlying probe, 
then jumps to the end.  I guess that is a "bug" that could be fixed.  
Apparently, we never test this scenario.

This "use case" (being generous here) seems to throw a monkey wrench 
into the works.  The plan was to look a PRID up in a BPF map.  Well, 
that scheme naively returns only one PRID, but now we're saying we could 
have at least two.  Also, given the PRID, the uprobe trampoline walks 
through the clauses only once.  Must the trampoline be set up to walk 
through the clauses multiple times?

Or, can we simply not support this case (multiple overlying probes for a 
given pid for the same underlying probe) for the time being?

>> + */
>> +static int
>> +gmap_create_uprobes(dtrace_hdl_t *dtp)
>> +{
>> +	dtp->dt_uprobesmap_fd = create_gmap(dtp, "uprobes", BPF_MAP_TYPE_HASH,
>> +			 sizeof(uprobe_map_key_t), sizeof(uprobe_map_val_t), 1000);
>> +	if (dtp->dt_uprobesmap_fd == -1)
>> +		return -1;
>> +
>> +	/* Populate the newly created map. */
>> +	dt_uprobe.update(dtp, NULL);
> This seems to be something that ought to be done in a function called from
> dtrace_go() that goes through the enablings (and perhaps also the retained
> ones), and calls a provider hook for any probes that match the probe spec
> that relates to it.  Something like that.  And then the provider code can do
> whatever needs doing for that particular matching probe.

Hmm.  Okay.  I guess it ought to go between the calls to 
dt_bpf_gmap_create() and dt_bpf_load_progs().

>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * Create the 'gvars' BPF map.
>>    *
>> @@ -1051,6 +1098,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>>   	CREATE_MAP(scratchmem)
>>   	CREATE_MAP(strtab)
>>   	CREATE_MAP(probes)
>> +	CREATE_MAP(uprobes)
>>   	CREATE_MAP(gvars)
>>   	CREATE_MAP(lvars)
>>   	CREATE_MAP(dvars)
>> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
>> index bc883e11..7bbeb02c 100644
>> --- a/libdtrace/dt_dlibs.c
>> +++ b/libdtrace/dt_dlibs.c
>> @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>>   	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
>> +	DT_BPF_SYMBOL(uprobes, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 1bf79d80..935b96f4 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -438,6 +438,7 @@ struct dtrace_hdl {
>>   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>>   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>>   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>> +	int dt_uprobesmap_fd;	/* file descriptor for the 'uprobes' BPF map */
>>   	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>>   	void *dt_errarg;	/* error handler argument */
>>   	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index 34906aa0..591f2fab 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -45,6 +45,7 @@
>>   #include "dt_probe.h"
>>   #include "dt_pid.h"
>>   #include "dt_string.h"
>> +#include "port.h"
>>   
>>   /* Provider name for the underlying probes. */
>>   static const char	prvname[] = "uprobe";
>> @@ -70,6 +71,15 @@ typedef struct list_probe {
>>   	dt_probe_t	*probe;
>>   } list_probe_t;
>>   
>> +/* uprobe_map_[key|val]_t are also defined in dt_bpf.c */
>> +typedef struct uprobe_map_key {
>> +	pid_t		pid;
>> +	dtrace_id_t	uprid;
>> +} uprobe_map_key_t;
>> +typedef struct uprobe_map_val {
>> +	dtrace_id_t	prid;
>> +	long long	mask;
>> +} uprobe_map_val_t;
>>   typedef struct list_clause {
>>   	dt_list_t	list;
>>   	uint_t		clause;
>> @@ -135,6 +145,54 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>>   	free_probe_list(dtp, datap);
>>   }
>>   
>> +/*
>> + * Update the uprobe provider.
>> + */
>> +static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
>> +{
>> +	dt_probe_t	*prp;
>> +
>> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>> +	     prp = dt_list_next(prp)) {
>> +		pid_t			pid;
>> +		const list_probe_t	*pup;
>> +		dt_probe_t		*uprp;
>> +		long long		mask = 0, bit = 1;
>> +		list_clause_t		*cl;
>> +		uprobe_map_key_t	key;
>> +		uprobe_map_val_t	val;
>> +
>> +		/* Make sure it is an overlying pid or USDT probe. */
>> +		if (prp->prov->impl != &dt_pid && prp->prov->impl != &dt_usdt)
>> +			continue;
>> +
>> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
>> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
>> +
>> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>> +			dt_uprobe_t	*upp;
>> +
>> +			uprp = pup->probe;
>> +			upp = uprp->prv_data;
>> +			for (cl = dt_list_next(&upp->clauses); cl != NULL; cl = dt_list_next(cl)) {
>> +				if (gmatch(prp->desc->prv, dtp->dt_uprovdescs[cl->clause]))
>> +					mask |= bit;
>> +
>> +				bit <<= 1;
>> +			}
>> +
>> +			key.pid = pid;
>> +			key.uprid = uprp->desc->id;
>> +
>> +			val.prid = prp->desc->id;
>> +			val.mask = mask;
>> +
>> +			// FIXME check return value
>> +			dt_bpf_map_update(dtp->dt_uprobesmap_fd, &key, &val);
>> +		}
>> +	}
>> +}
>> +
>>   
>>   /*
>>    * Look up or create an underlying (real) probe, corresponding directly to a
>> @@ -803,6 +861,7 @@ dt_provimpl_t	dt_uprobe = {
>>   	.probe_info	= &probe_info,
>>   	.detach		= &detach,
>>   	.probe_destroy	= &probe_destroy_underlying,
>> +	.update		= &update_uprobe,
>>   };
>>   
>>   /*
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
